//
//  OrderModel.swift
//  CupcakeCorner
//
//  Created by 이태현 on 2022/02/22.
//

import Foundation

struct OrderModel: Codable {
    
    var type: Int = 0
    var quantity: Int = 3
    var specialRequestEnable: Bool = false {
        didSet {
            if !specialRequestEnable {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting: Bool = false
    var addSprinkles: Bool = false
    var name: String = ""
    var streetAddress: String = ""
    var city: String = ""
    var zip: String = ""
    
}
