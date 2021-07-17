//
//  UserData.swift
//  Shopify e-commerce
//
//  Created by Ayman Omara on 30/05/2021.
//  

import Foundation
class UserData {
    public static let sharedInstance = UserData()
    private var userDefaults:UserDefaults
    
    private init(){
        userDefaults = UserDefaults.standard
    }
    
    func saveUserDefaults(customer:Customer) -> Void {
        userDefaults.set(true, forKey: Constants.isLoggedInUserDefaults)
        userDefaults.set(customer.email!, forKey: Constants.emailUserDefaults)
        userDefaults.set(customer.id!, forKey: Constants.idUserDefaults)
        userDefaults.set(customer.firstName ?? "", forKey: Constants.firstNameUserDefaults)
        userDefaults.set(customer.lastName ?? "", forKey: Constants.lastNameUserDefaults)
        if(!customer.addresses!.isEmpty){
            let addressID = (customer.addresses!.count - 1)
            print("=======================\(addressID)")
            userDefaults.set(customer.addresses?[addressID]!.city!, forKey: Constants.cityUserDefaults)
            userDefaults.set(customer.addresses?[addressID]!.country!, forKey: Constants.countryUserDefaults)
            userDefaults.set(customer.addresses?[addressID]!.address1!, forKey: Constants.addressUserDefaults)
        }else{
            userDefaults.set("No Country", forKey: Constants.cityUserDefaults)
            userDefaults.set("No City", forKey: Constants.countryUserDefaults)
            userDefaults.set("No Address", forKey: Constants.addressUserDefaults)
        }
    }
    
    func isLoggedIn()->Bool{
        var loggedIn = userDefaults.value(forKey: Constants.isLoggedInUserDefaults)
        if(loggedIn != nil){
            if(loggedIn as! Bool){
                return true
            }else{
                return false
            }
        }else{
            return false
        }
    }
    
    func getUserFromUserDefaults() -> Customer {
        let firstName = userDefaults.value(forKey: Constants.firstNameUserDefaults) as? String
        let lastName = userDefaults.value(forKey: Constants.lastNameUserDefaults) as? String
        let email = userDefaults.value(forKey: Constants.emailUserDefaults) as? String
        let id = userDefaults.value(forKey: Constants.idUserDefaults) as? Int
        let country = userDefaults.value(forKey: Constants.countryUserDefaults) as? String
        let city = userDefaults.value(forKey: Constants.cityUserDefaults) as? String
        let address = userDefaults.value(forKey: Constants.addressUserDefaults) as? String
        return Customer(id: id, email: email, firstName: firstName, lastName: lastName, phone: nil, tags: nil, addresses: [Address(id: nil, customerID: nil, city: city, country: country, address1: address)])
    }
    
    func deleteUserDefaults(){
        userDefaults.set(false, forKey: Constants.isLoggedInUserDefaults)
        userDefaults.set("", forKey: Constants.emailUserDefaults)
        userDefaults.set(0, forKey: Constants.idUserDefaults)
        userDefaults.set("", forKey: Constants.firstNameUserDefaults)
        userDefaults.set("", forKey: Constants.lastNameUserDefaults)
        userDefaults.set("", forKey: Constants.cityUserDefaults)
        userDefaults.set("", forKey: Constants.countryUserDefaults)
        userDefaults.set("", forKey: Constants.addressUserDefaults)
    }
    
    func setInitialCurrency(){
        if(userDefaults.value(forKey: Constants.currencyUserDefaults) == nil){
            userDefaults.set("EGP", forKey: Constants.currencyUserDefaults)
        }
    }
    
    func setCurrency(type:String){
        userDefaults.set(type, forKey: Constants.currencyUserDefaults)
    }
    
    func getCurrency()->String{
        return userDefaults.value(forKey: Constants.currencyUserDefaults) as! String
    }
    func returnCurrency() -> String {
        return userDefaults.string(forKey: Constants.currencyUserDefaults)!
    }
    
    func getAddress()->String{
        let add = userDefaults.value(forKey: Constants.addressUserDefaults) as? String ?? "No address"
        let city = ", " + ((userDefaults.value(forKey: Constants.cityUserDefaults) as? String) ?? "No City")
        let country = ", " + ((userDefaults.value(forKey: Constants.countryUserDefaults) as? String) ?? "No Country")
        return add + city + country
    }
    
    func setAddress(newAddress: String){
        userDefaults.set(newAddress, forKey: Constants.addressUserDefaults)
    }
    
}
