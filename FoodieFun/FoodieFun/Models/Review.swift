//
//  Review.swift
//  FoodieFun
//
//  Created by Alex Shillingford on 1/9/20.
//  Copyright © 2020 Alex Shillingford. All rights reserved.
//

import Foundation
struct Review: Codable {
    var id: Int?
    var menuItem: String
    var cuisine: String
    var price: String
    var rating: Int
    var review: String
    var image: String?
    var userID: Int
    var restaurantID: Int
    
    enum ReviewCodingKeys: String, CodingKey {
        case menuItem = "menu_item"
        case image = "img"
        case userID = "foodie_id"
        case restaurantID = "restaurant_id"
    }
}
