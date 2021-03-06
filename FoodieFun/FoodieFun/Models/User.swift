//
//  User.swift
//  FoodieFun
//
//  Created by Alex Shillingford on 1/7/20.
//  Copyright © 2020 Alex Shillingford. All rights reserved.
//

import Foundation

struct User: Codable {
    var id: Int?
    var username, password, email, location: String
    
    
    var foodieId: Int {
        return id ?? 0
    }
}
