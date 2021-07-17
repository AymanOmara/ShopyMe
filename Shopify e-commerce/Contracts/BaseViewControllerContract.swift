//
//  BaseViewControllerContract.swift
//  Shopify e-commerce
//
//  Created by Amr Muhammad on 6/1/21.
//  
//

import Foundation
protocol BaseViewControllerContract {
    func showLoading()
    
    func hideLoading()
    
    func showErrorMessage(errorMessage: String)
}
