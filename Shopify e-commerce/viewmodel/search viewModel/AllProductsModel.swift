//
//  AllProductsModel.swift
//  Shopify e-commerce
//
//  Created by Amr Muhammad on 6/3/21.
//  
//

import Foundation

// MARK: - AllProductsModel
struct AllProductsModel: Codable {
    let products: [SearchProduct]
}

// MARK: - Product
struct SearchProduct: Codable {
    let id: Int
    let title, bodyHTML, vendor: String
    let productType: ProductType
    let createdAt: String
    let handle: String
    let updatedAt, publishedAt: String
    let templateSuffix: String?
    let status: Status
    let publishedScope: PublishedScope
    let tags, adminGraphqlAPIID: String
    let variants: [Variant]
    let options: [Option]
    let images: [Image]
    let image: Image

    enum CodingKeys: String, CodingKey {
        case id, title
        case bodyHTML = "body_html"
        case vendor
        case productType = "product_type"
        case createdAt = "created_at"
        case handle
        case updatedAt = "updated_at"
        case publishedAt = "published_at"
        case templateSuffix = "template_suffix"
        case status
        case publishedScope = "published_scope"
        case tags
        case adminGraphqlAPIID = "admin_graphql_api_id"
        case variants, options, images, image
    }
}

enum Name: String, Codable {
    case color = "Color"
    case size = "Size"
}

enum ProductType: String, Codable {
    case accessories = "ACCESSORIES"
    case shoes = "SHOES"
    case tShirts = "T-SHIRTS"
}

enum PublishedScope: String, Codable {
    case web = "web"
}

enum Status: String, Codable {
    case active = "active"
}

enum FulfillmentService: String, Codable {
    case manual = "manual"
}

enum InventoryManagement: String, Codable {
    case shopify = "shopify"
}

enum InventoryPolicy: String, Codable {
    case deny = "deny"
}

// MARK: - Variant
struct Variant: Codable {
    let productID, id: Int
    let title, price, sku: String
    let position: Int
    let inventoryPolicy: InventoryPolicy
    let compareAtPrice: String?
    let fulfillmentService: FulfillmentService
    let inventoryManagement: InventoryManagement
    let option1: String
    let option2: Option2?
    let createdAt, updatedAt: String
    let taxable: Bool
    let barcode: String?
    let grams: Int
    let weight: Int
    let weightUnit: WeightUnit
    let inventoryItemID, inventoryQuantity, oldInventoryQuantity: Int
    let requiresShipping: Bool
    let adminGraphqlAPIID: String

    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case id, title, price, sku, position
        case inventoryPolicy = "inventory_policy"
        case compareAtPrice = "compare_at_price"
        case fulfillmentService = "fulfillment_service"
        case inventoryManagement = "inventory_management"
        case option1, option2
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case taxable, barcode, grams
        case weight
        case weightUnit = "weight_unit"
        case inventoryItemID = "inventory_item_id"
        case inventoryQuantity = "inventory_quantity"
        case oldInventoryQuantity = "old_inventory_quantity"
        case requiresShipping = "requires_shipping"
        case adminGraphqlAPIID = "admin_graphql_api_id"
    }
}

enum Option2: String, Codable {
    case beige = "beige"
    case black = "black"
    case blue = "blue"
    case burgandy = "burgandy"
    case gray = "gray"
    case lightBrown = "light_brown"
    case red = "red"
    case white = "white"
    case yellow = "yellow"
}

enum WeightUnit: String, Codable {
    case kg = "kg"
}
