//
//  Rating.swift
//  FoodieFun
//
//  Created by Alex Shillingford on 1/9/20.
//  Copyright © 2020 Alex Shillingford. All rights reserved.
//

import Foundation

struct Rating: Codable {
    var id, restaurantID: Int
    var foodRating, drinksRating, decorRating, serviceRating, cleanlinessRating: String
}
