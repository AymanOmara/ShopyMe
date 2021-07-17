//
//  BaseViewModel.swift
//  Shopify e-commerce
//
//  Created by Amr Muhammad on 5/25/21.
//  
//

import Foundation
import RxSwift
import RxCocoa

protocol ViewModelType {
    func fetchData()
    var errorObservable: Observable<Bool> {get}
    var loadingObservable: Observable<Bool> {get}
}
