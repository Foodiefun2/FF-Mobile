//
//  Bearer.swift
//  FoodieFun
//
//  Created by Alex Shillingford on 1/9/20.
//  Copyright © 2020 Alex Shillingford. All rights reserved.
//

import Foundation

struct Bearer: Codable {
    var token: String
    var user: User
}
