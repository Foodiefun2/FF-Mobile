//
//  Review.swift
//  FoodieFun
//
//  Created by Alex Shillingford on 1/9/20.
//  Copyright © 2020 Alex Shillingford. All rights reserved.
//

import Foundation
struct Review {
    var id: Int
    var menuItem: String
    var cuisine: Cuisine
    var price: Int
    var rating: Int
    var review: String
    var image: String?
    var userID: Int
    var restaurantID: Int
}
