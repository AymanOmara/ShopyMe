//
//  SearchViewModel.swift
//  Shopify e-commerce
//
//  Created by Amr Muhammad on 6/2/21.
// 
//

import Foundation
import RxSwift
import RxCocoa

class SearchViewModel : SearchViewModelContract{
    var dataObservable: Observable<[SearchProduct]>
    var searchValue : BehaviorRelay<String> = BehaviorRelay(value: "")
    var errorObservable: Observable<Bool>
    var loadingObservable: Observable<Bool>
    
    private lazy var searchValueObservable:Observable<String> = searchValue.asObservable()
    private var disposeBag = DisposeBag()
    private var datasubject = PublishSubject<[SearchProduct]>()
    private var shopifyAPI:AllProductsAPIContract!
    private var errorsubject = PublishSubject<Bool>()
    private var Loadingsubject = PublishSubject<Bool>()
    private var data:[SearchProduct]!
    private var searchedData:[SearchProduct]!
    private var sortedData:[SearchProduct]!
    private var filteredData:[SearchProduct]!
    private var isSorted:Bool = false
    private var isfiltered:Bool = false

 
    init() {
        shopifyAPI = ShopifyAPI.shared
        dataObservable = datasubject.asObservable()
        errorObservable = errorsubject.asObservable()
        loadingObservable = Loadingsubject.asObservable()
        searchedData = data
        
        searchValueObservable.subscribe(onNext: {[weak self] (value) in
        print("value is \(value)")
            self?.searchedData = self?.data?.filter({ (product) -> Bool in
//          product.title.lowercased().prefix(value.count) == value.lowercased()
            product.title.lowercased().contains(value.lowercased())
        })
//        if(self?.searchedData != nil){
//            if(self!.searchedData!.isEmpty){
//                self?.searchedData = self?.data
//            }
//        }
            if(value.isEmpty){
                self?.isfiltered = false
                self?.isSorted = false
                self?.searchedData = self?.data
            }
        self?.datasubject.onNext(self?.searchedData ?? [])
        }).disposed(by: disposeBag)
    }
    
    func fetchData(){
        Loadingsubject.onNext(true)
        shopifyAPI.getAllProducts {[weak self] (result) in
            switch result{
            case .success(let products):
                self?.errorsubject.onNext(false)
                self?.data = products?.products
                self?.searchedData = self?.data
                self?.sortedData = self?.data
                self?.filteredData = self?.data

                self?.datasubject.onNext(products?.products ?? [])
                self?.Loadingsubject.onNext(false)
            case .failure(let error):
                self?.Loadingsubject.onNext(false)
                self?.errorsubject.onNext(true)
            }
        }
    }
    
    func sortData(index:Int){
        isSorted = true
        if(isfiltered){
            switch index {
            case 0:
                sortedData = filteredData.sorted { (product1, product2) -> Bool in
                    Double(product1.variants[0].price)! > Double(product2.variants[0].price)!
                }
            default:
                sortedData = filteredData.sorted { (product1, product2) -> Bool in
                    Double(product1.variants[0].price)! < Double(product2.variants[0].price)!
                }
            }
        }else{
            switch index {
            case 0:
                sortedData = searchedData.sorted { (product1, product2) -> Bool in
                    Double(product1.variants[0].price)! > Double(product2.variants[0].price)!
                }
            default:
                sortedData = searchedData.sorted { (product1, product2) -> Bool in
                    Double(product1.variants[0].price)! < Double(product2.variants[0].price)!
                }
            }
        }
        datasubject.onNext(sortedData)
    }
    
    func filterData(word:String){
        isfiltered = true
        if(isSorted){
            filteredData = sortedData.filter({ (product) -> Bool in
            product.productType.rawValue.lowercased() == word.lowercased()
            })
        }else{
            filteredData = searchedData.filter({ (product) -> Bool in
            product.productType.rawValue.lowercased() == word.lowercased()
            })
        }
        datasubject.onNext(filteredData)
    }
    
    func clearData(){
        if(isSorted){
            datasubject.onNext(sortedData)
        }else{
            datasubject.onNext(searchedData)
        }
        isfiltered = false
    }
}
