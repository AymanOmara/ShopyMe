//
//  MeAPIContracts.swift
//  Shopify e-commerce
//
//  Created by Amr Muhammad on 6/10/21.
//  
//

import Foundation
protocol RegisterAPIContract {
    func addCustomer(customerData:RegisterCustomer,completion: @escaping (Result<RegisterCustomer?,NSError>) -> Void)
}

protocol EditInfoAPIContract {
    func editCustomer(customerData:RegisterCustomer,id:Int,completion: @escaping (Result<RegisterCustomer?,NSError>) -> Void)
    func getCustomer(id:Int,completion: @escaping (Result<RegisterCustomer?,NSError>) -> Void)
}
