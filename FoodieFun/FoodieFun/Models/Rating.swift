//
//  Rating.swift
//  FoodieFun
//
//  Created by Alex Shillingford on 1/9/20.
//  Copyright © 2020 Alex Shillingford. All rights reserved.
//

import Foundation

struct Rating: Codable {
    var id, restaurantID, userID: Int
    var foodRating, drinksRating, decorRating, serviceRating, cleanlinessRating, vibe: String
    
    enum RatingCodingKeys: String, CodingKey {
        case foodRating = "food_rating"
        case drinksRating = "drinks_rating"
        case decorRating = "decor_rating"
        case serviceRating = "service_rating"
        case cleanlinessRating = "cleanliness_rating"
        case restaurantID = "restaurant_id"
        case userID = "foodie_id"
    }
}
