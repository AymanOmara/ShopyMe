//
//  wishListViewController.swift
//  Shopify e-commerce
//
//  Created by marwa on 6/4/21.
//  
//

import UIKit
import RxCocoa
import RxSwift
import Lottie

class wishListViewController: UIViewController {
    
    private var productId: Int!
    private var productMainCategory: String?
    private var localProduct : LocalProductDetails!
    
    var wishListViewModelObj : wishListViewModelType!
   //@IBOutlet weak var toolBar: UIToolbar!
    private let disposeBag = DisposeBag()
    @IBOutlet weak var animationImgView: UIView!
    @IBOutlet weak var wishListCollectionView: UICollectionView!
    
    @IBOutlet weak var cartNavBarView: RightNavBarView!
    
    lazy var backgroundAnimationView: AnimationView = {
        let animationView = AnimationView()
        animationImgView.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.topAnchor.constraint(equalTo: animationImgView.topAnchor).isActive = true
        animationView.rightAnchor.constraint(equalTo: animationImgView.rightAnchor).isActive = true
        animationView.leftAnchor.constraint(equalTo: animationImgView.leftAnchor).isActive = true
        animationView.bottomAnchor.constraint(equalTo: animationImgView.bottomAnchor).isActive = true
        
        return animationView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        wishListViewModelObj = wishListViewModel()
        
         wishListViewModelObj.dataDrive.drive(onNext: {[weak self] (val) in
            if(val.count == 0){
                self?.wishListEmpty()
            }else{
                self?.wishListNotEmpty()
                self!.wishListCollectionView.delegate = nil
                self!.wishListCollectionView.dataSource = nil
            Observable.just(val).bind(to: self!.wishListCollectionView.rx.items(cellIdentifier: Constants.wishListCell)){row,item,cell in
                (cell as? wishListCollectionViewCell)?.cellProduct = item
            (cell as? wishListCollectionViewCell)?.delegate = self
         //   cell.layer.cornerRadius = 20
            cell.layer.borderWidth = 0.0
            cell.layer.shadowColor = UIColor.gray.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 0)
            cell.layer.shadowRadius = 5.0
            cell.layer.shadowOpacity = 1
            cell.layer.masksToBounds = true
            }.disposed(by: self!.disposeBag)
        }
    }).disposed(by: disposeBag)
        
       wishListViewModelObj.errorDrive.drive(onNext: {[weak self] (val) in
            if(val){
                self!.wishListEmpty()
            }
        }).disposed(by: disposeBag)
        
        wishListCollectionView.rx.modelSelected(LocalProductDetails.self).subscribe(onNext: {[weak self] (productItem) in
            let storyBoard : UIStoryboard = UIStoryboard(name: "productDetails", bundle:nil)
            let productDetailsVC = storyBoard.instantiateViewController(identifier: Constants.productDetailsVC) as! ProductDetailsTableViewController
            productDetailsVC.productId = "\(productItem.productId)"
            self?.navigationController?.pushViewController(productDetailsVC, animated: true)
        }).disposed(by: disposeBag)
        
        wishListViewModelObj.quantutyObservable.bind(to: cartNavBarView.rx.quantity).disposed(by: disposeBag)
        wishListViewModelObj.checkProductInCartObservable.subscribe(onNext: { (resBool) in
            if (resBool){
                let alertController = UIAlertController(title: "", message: "Sorry, This product is already in cart!", preferredStyle: UIAlertController.Style.alert)
                  alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (action: UIAlertAction!) in
                        print("Handle Cancel Logic here")
                  }))
                self.present(alertController, animated: true, completion: nil)
            } else {
                self.productMainCategory = self.localProduct.mainCategory
                self.performSegue(withIdentifier: "ColorSizeSegue", sender: nil)
            }
        }).disposed(by: disposeBag)
        
        /*
         
         */
//        wishListViewModelObj.getwishListData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        wishListViewModelObj.getCartQuantity()
        wishListViewModelObj.getwishListData()
         playBackgroundAnimation()
    }

         
    @IBAction func navigateToCart(_ sender: UIButton) {
        if(UserData.sharedInstance.isLoggedIn()){
            if checkVC(addedVC: CardViewController.self) {
                print("checkVC is NOT nil")
                navigationController?.popViewController(animated: true)
            } else {
                print("checkVC is NIIIIIIIL")

                let cartViewController = storyboard?.instantiateViewController(identifier: Constants.cartVC) as! CardViewController
                navigationController?.pushViewController(cartViewController, animated: true)
            }
        }else{
            Support.notifyUser(title: "Error", body: "Kindly Login to be able to see Cart", context: self)
        }
    }
    
    func wishListEmpty() {
        print("it is empty ................")
        self.wishListCollectionView.isHidden = true
      //  self.toolBar.isHidden = true
        self.animationImgView.isHidden = false
    }
   func wishListNotEmpty() {
       self.wishListCollectionView.isHidden = false
     //  self.toolBar.isHidden = false
       self.animationImgView.isHidden = true
       print("it not is empty ................")
   }
    
    private func playBackgroundAnimation(){
        let animation = Animation.named("3617-shopping-bag-error")
        backgroundAnimationView.animation = animation
       
        backgroundAnimationView.play(fromProgress: 0,
                           toProgress: 1,
                           loopMode: LottieLoopMode.loop,
                           completion: { (finished) in
        })
    }
}


extension wishListViewController: CollectionViewCellDelegate{
    func showMovingAlert(msg: String , product : LocalProductDetails) {
        localProduct = product
        productId = product.productId
        wishListViewModelObj.checkIfCart(productId: productId)
        
        
    }
    
    func showAlert(msg : String , product : LocalProductDetails) {
      
      let alertController = UIAlertController(title: "", message: msg, preferredStyle: UIAlertController.Style.alert)

      alertController.addAction(UIAlertAction(title: "Delete", style: .default, handler: { [weak self] (action: UIAlertAction!) in
            print("Handle Ok logic here")
        self!.wishListViewModelObj.deleteWishListData(product: product)
      }))

      alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
      }))

      present(alertController, animated: true, completion: nil)
    }

}

extension wishListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? ColorSizeViewController {
            if segue.identifier == "ColorSizeSegue" {
                controller.productId = productId
                controller.mainCategory = productMainCategory
                controller.senderVC = self
                controller.modalPresentationStyle = .custom
            }
        }
    }
}








/*
 func showMovingAlert(msg: String , product : LocalProductDetails) {
         
         productId = product.productId
         productMainCategory = product.mainCategory
         performSegue(withIdentifier: "ColorSizeSegue", sender: nil)

 //        let alertController = UIAlertController(title: "", message: msg, preferredStyle: UIAlertController.Style.alert)
 //        alertController.addAction(UIAlertAction(title: "add", style: .default, handler: { [weak self](action: UIAlertAction!) in
 //              print("Handle Ok logic here")
 //            self!.wishListViewModelObj.addToCart(product : product)
 //        }))
 //
 //        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
 //              print("Handle Cancel Logic here")
 //        }))
 //
 //        present(alertController, animated: true, completion: nil)
     }
 */
