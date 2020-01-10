//
//  Restaurant.swift
//  FoodieFun
//
//  Created by Alex Shillingford on 1/7/20.
//  Copyright © 2020 Alex Shillingford. All rights reserved.
//

import Foundation

struct Restaurant: Codable {
    var id: Int?
    var name, location, hours, image: String
    var cuisine: String
    var reviews: [Review]
}
