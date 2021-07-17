//
//  Constants.swift
//  Sportify
//
//
// 
//

import Foundation

struct Constants {
    // MARK: Ahmed Section
    
    static let prductDetails = "products/"
    static let endPath = ".json"
    static let imageCell = "ImageCollectionViewCell"
    static let colorCell = "ColorViewCollectionViewCell"
    static let sizeCell = "SizeCollectionViewCell"
    static let productDetailsVC = "ProductDetailsTableViewController"
    
    static let favoriteCoraDataEntity = "FavoriteProducts"
    static let cartCoraDataEntity = "CartProducts"
    static let ordersCoraDataEntity = "Orders"
    static let productIdCoraDataAtt = "productId"
    static let userEmailCoraDataAtt = "userEmail"
    static let mainCategoryCoraDataAtt = "mainCategory"
    static let productImageCoraDataAtt = "productImage"
    static let productPriceCoraDataAtt = "productPrice"
    static let quantityCoraDataAtt = "quantity"
    static let selectedColorCoraDataAtt = "selectedColor"
    static let selectedSizeCoraDataAtt = "selectedSize"
    static let titleCoraDataAtt = "title"
    static let invQuantCoraDataAtt = "inventory_quantity"
    static let totalPriceCoraDataAtt = "totalPrice"
    static let orderIdCoraDataAtt = "orderId"
    static let creationDateCoraDataAtt = "creationDate"
    
    
    
    //end
    
    // MARK: Amr Section
        static let genericError = "error in networkLayer"
        static let baseURL = "https://ce751b18c7156bf720ea405ad19614f4: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@itiana.myshopify.com/admin/api/2021-04/"
        static let mainCatNibCelln = "MainCategoryCollectionViewCell"
    static let subCatNibCell = "SubCategoryCollectionViewCell"
    static let productNibCell = "ProductsCollectionViewCell"
    static let mainCategories = ["Men","Women","Kids"]
    static let subCategories = ["T-Shirts","Shoes","Accessories"]
    static let menCatPath = "collections/268359598278/products.json"
    static let womenCatPath = "collections/268359631046/products.json"
    static let kidCatPath = "collections/268359663814/products.json"
    static let searchViewController = "SearchProductViewController"
    static let allProductsPath = "products.json"
    static let sortList = ["Price: High to low","Price: Low to High"]
    static let filterList = ["T-Shirts","Shoes","Accessories","Clear"]
    static let putCustomerPath = "customers/"
    static let postCustomerPath = "customers.json"
    static let isLoggedInUserDefaults = "isLoggedIn"
    static let firstNameUserDefaults = "firstName"
    static let lastNameUserDefaults = "lastName"
    static let emailUserDefaults = "email"
    static let idUserDefaults = "userID"
    static let cityUserDefaults = "city"
    static let countryUserDefaults = "country"
    static let currencies = ["EGP","USD"]
    static let currencyUserDefaults = "currency"
    static let getCustomerPath = "customers/"
    static let backendURL = "https://shopify-iti41.herokuapp.com/"
    static let addressUserDefaults = "address"





           //end
    
    
    // MARK: Ayman Section
    static let customersURL = "customers.json"
    //static let newCustomer = "customers.json"
    static let u_p_notfound_t = "user name or password not found"
    static let u_p_required_t = "user name and password are required"
    static let loginSuccess = "login success"
    static let registerdSuccess = "registerd Successfully"
    static let empty = ""
    static let accountExisted = "You already have an account"
    static let faild = "faild"
    static let faildBody = "Please try again later"
    static let allfeildReq = "all feilds are required"
    static let pass_conf = "password and confirmation password should be identical"
    static let wrongEmail_Pass = "Worng email or password"
    static let emailIsnotValid_T = "Email is not valid"
    static let emailIsnotValid_B = "please enter valid email"
    static let fullURL = "https://ce751b18c7156bf720ea405ad19614f4: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@itiana.myshopify.com/admin/api/2021-04/customers.json"
    //end
    
    
    // MARK: Marwa Section
      static let allWomenProduct = "collections/268359631046/products.json"
      static let allMenProduct = "collections/268359598278/products.json"
      static let allKidsProduct = "collections/268359663814/products.json"
      static let discountCode = "price_rules/950267576518/discount_codes.json"
      static let womenGif = "https://media.giphy.com/media/3o6EhTpmOMApdn87cI/giphy.gif"
      static let menGif = "https://media.giphy.com/media/26vUCw2Wsa4N3ezsc/giphy.gif"
      static let kidsGif = "https://media.giphy.com/media/l3q2rCBSrr6D7XKLK/giphy.gif"
      static let shopCell = "shopCollectionViewCell"
      static let menuCell = "mainCategoriesCollectionViewCell"
      static let wishListCell = "wishListCollectionViewCell"
      static let cartTableCell = "cartTableViewCell"
      static let receiptCell = "receiptTableViewCell"
      static let wishListVC = "wishListViewController"
      static let cartVC = "cartViewController"
      static let receiptVC = "receiptViewController"
      static let addressVC = "addressViewController"
      static let applyCoupons = "applyCouponsViewController"
      static let receiptProductCell = "receiptProductCollectionViewCell"
      static let couponsStateCell = "couponsStateCollectionViewCell"
      static let availableCouponCell = "availableCouponTableViewCell"
      static let NotAvailableCell = "NotAvailableTableViewCell"
      static let addressCell = "addressTableViewCell"
      static let moveFromBagToWishMsg = "Are you sure, you want to move these items from bag to wish list?"
      static let deleteFromBagMsg = "Are you sure, you want to delete these items from bag?"
      static let addToBagFromWishMsg = "Are you sure you want to add these items to bag ? "
      static let deleteFromWishMsg = "Are you sure you want to delete these items from wish List ? "
    
    static let loginBeforeCartMsg = "Kindly Login to be able to see Cart"
    static let loginBeforeFavtMsg = "Kindly Login to be able to see Favourite List"
    static let loginBeforeAddCartMsg = "Kindly Login to be able to add to Cart"
    //end
    
}
	
