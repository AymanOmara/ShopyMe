//
//  discountCode.swift
//  Shopify e-commerce
//
//  Created by marwa on 6/4/21.
// 
//

import Foundation
// MARK: - DiscountCode
struct discountCode: Codable {
    let discountCodes: [DiscountCodeElement]

    enum CodingKeys: String, CodingKey {
        case discountCodes = "discount_codes"
    }
}

// MARK: - DiscountCodeElement
struct DiscountCodeElement: Codable {
    let id, priceRuleID: Int
    let code: String
    let usageCount: Int
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case priceRuleID = "price_rule_id"
        case code
        case usageCount = "usage_count"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
