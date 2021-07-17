//
//  ProductDetailsContracts.swift
//  Shopify e-commerce
//
//  Created by Ahmd Amr on 06/06/2021.
//  
//

import Foundation
import RxSwift


protocol ProductDetailsAPIType {
    func getProductDetails(productId:String, completion: @escaping (Result<ProductDetailsModel?,NSError>) -> Void)
}


protocol ProductDetailsViewModelType {
    func getProductDetails(id: String, mainCategory: String?)
    func getLocalData()
    func isUserLoggedIn (completion: @escaping (Bool) -> Void)
    func checkIfCart()
    func addTofavorite()
    func removefromFavorite()
    func addToCart(selectedSize: String?, selectedColor: UIColor?)
    func updateCartProduct(selectedSize: String?, selectedColor: UIColor?)
    func getCartQuantity()
    
    var imagesObservable: Observable<[ProductDetailsImage]> {get}
    var colorsObservable: Observable<[UIColor]> {get}
    var sizesObservable: Observable<[String]> {get}
    var productTitleObservable: Observable<String> {get}
    var productPriceObservable: Observable<String> {get}
    var productVendorObservable: Observable<String> {get}
    var productDescriptionObservable: Observable<String> {get}
    var quantutyObservable: Observable<String> {get}
    var currencyObservable: Observable<String> {get}
    var userCityObservable: Observable<String> {get}
    var checkProductInFavoriteObservable: Observable<Bool> {get}
    var checkProductInCartObservable: Observable<(Bool, (String, Int), (UIColor, Int))> {get}
    var showErrorObservable: Observable<[String]> {get}
    var showLoadingObservable: Observable<Bool> {get}
    var showToastObservable: Observable<String> {get}
    var connectivityObservable: Observable<Bool> {get}
}
