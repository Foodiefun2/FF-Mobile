//
//  Restaurant.swift
//  FoodieFun
//
//  Created by Alex Shillingford on 1/7/20.
//  Copyright © 2020 Alex Shillingford. All rights reserved.
//

import Foundation

struct Restaurant {
    var id: Int?
    var name, location: String
    var cuisine: Cuisine
    var monThursHours, friSatHours, sundayHours: String
    var foodRating: Double
    var drinkRating: Double
    var serviceRating: Double
    var cleanlinessRating: Double
    var overallRating: Double
}
