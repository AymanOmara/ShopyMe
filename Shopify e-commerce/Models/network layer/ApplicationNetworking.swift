//
//  ApplicationAPI.swift
//  Shopify e-commerce
//
//  Created by Amr Muhammad on 5/23/21.
// 
//

import Foundation
import Alamofire

enum ApplicationNetworking{
    // MARK: Ahmed Section
    
    case getProductDetails(id:String)
    
    //end
    
    // MARK: Amr Section
    case getMenCategoryProducts
    case getWomenCategoryProducts
    case getKidsCategoryProducts
    case getAllProducts
    case putCustomer(customer:RegisterCustomer,id:Int)
    case postCustomer(customer:RegisterCustomer)
    case getCustomer(id:Int)

    //end
    
    
    // MARK: Ayman Section
    case customers
    
    //end
    
    
    // MARK: Marwa Section
    case allWomenProduct
    case allMenProduct
    case allKidsProduct
    case discountCode
    //end
}

extension ApplicationNetworking : TargetType{
    var baseURL: String {
        switch self{
        default:
            return Constants.baseURL
        }
    }
    
    var path: String {
        switch self{
            // MARK: Ahmed Section
            case .getProductDetails(let id):
                return Constants.prductDetails + id + Constants.endPath
            //end
            
            // MARK: Amr Section
        case .getMenCategoryProducts:
            return Constants.menCatPath
        case .getWomenCategoryProducts:
            return Constants.womenCatPath
        case .getKidsCategoryProducts:
            return Constants.kidCatPath
        case .getAllProducts:
            return Constants.allProductsPath
        case .putCustomer(_,let id):
            return Constants.putCustomerPath+"\(id).json"
        case .postCustomer:
            return Constants.postCustomerPath
        case .getCustomer(let id):
            return Constants.getCustomerPath+"\(id).json"
            //end
            
            
            // MARK: Ayman Section
        case .customers:
            return Constants.customersURL
            
            //end
            
            
            // MARK: Marwa Section
            case .allWomenProduct :
                return Constants.allWomenProduct
            case .allMenProduct:
                return Constants.allMenProduct
            case .allKidsProduct:
                return Constants.allKidsProduct
            case .discountCode:
                return Constants.discountCode
            //end
        }
    }
    
    var method: HTTPMethod {
        switch self{
            // MARK: Ahmed Section
            
            case .getProductDetails:
                return .get
            //end
            
            // MARK: Amr Section
            case .getMenCategoryProducts:
                return .get
            case .getWomenCategoryProducts:
                return .get
            case .getKidsCategoryProducts:
                return .get
            case .getAllProducts:
                return .get
        case .putCustomer:
            return .put
        case .postCustomer:
            return .post
        case .getCustomer:
            return .get
            //end
            
            
            // MARK: Ayman Section
            case .customers:
                return .get
        
            //end
            
            
            // MARK: Marwa Section
            
            //end


            case .allWomenProduct:
                 return .get
            case .allMenProduct:
                return .get
            case .allKidsProduct:
                return .get
            case .discountCode:
                return .get
            //end       
        }
    }
    
    var task: Task {
        switch self{
            // MARK: Ahmed Section
            case .getProductDetails:
                return .requestPlain
            //end
            
            // MARK: Amr Section
            case .getMenCategoryProducts:
                return .requestPlain
            case .getWomenCategoryProducts:
                return .requestPlain
            case .getKidsCategoryProducts:
                return .requestPlain
            case .getAllProducts:
                return .requestPlain
        case .putCustomer(let customer,_):
            return .requestParameters(parameters: ["object":customer], encoding: URLEncoding.default)
        case .postCustomer(let customer):
            return .requestParameters(parameters: ["object":customer], encoding: URLEncoding.default)
            
        case .getCustomer:
            return .requestPlain
            //end
            
            
            // MARK: Ayman Section
        case .customers:
            return .requestPlain
            
            //end
            
            
            // MARK: Marwa Section
            case .allWomenProduct:
                return.requestPlain
            case .allMenProduct:
                return .requestPlain
            case .allKidsProduct:
                return .requestPlain
           case .discountCode:
            return.requestPlain
        }
            //end
        
    }
    var headers: [String : String]? {
            switch self{
            default:
                return ["Accept": "application/json","Content-Type": "application/json","X-Shopify-Access-Token":"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"]
            }
        }
}
