//
//  File.swift
//  CupcakeCorner
//
//  Created by 이태현 on 2022/02/20.
//

import SwiftUI

class Order: ObservableObject, Codable {
    enum Codingkeys: CodingKey {
        case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
    }
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

    @Published var orderModel = OrderModel()
    
    var type: Int {
        get {
            orderModel.type
        }
        set {
            orderModel.type = newValue
        }
    }
    
    var quantity: Int {
        get {
            orderModel.quantity
        }
        set {
            orderModel.quantity = newValue
        }
    }
    
    var specialRequestEnable: Bool {
        get {
            orderModel.specialRequestEnable
        }
        set {
            orderModel.specialRequestEnable = newValue
        }
    }
    
    var extraFrosting: Bool {
        get {
            orderModel.extraFrosting
        }
        set {
            orderModel.extraFrosting = newValue
        }
    }
    
    var addSprinkles: Bool {
        get {
            orderModel.addSprinkles
        }
        set {
            orderModel.addSprinkles = newValue
        }
    }
    var name: String {
        get {
            orderModel.name
        }
        set {
            orderModel.name = newValue
        }
    }
    
    var streetAddress: String {
        get {
            orderModel.streetAddress
        }
        set {
            orderModel.streetAddress = newValue
        }
    }
    
    var city: String {
        get {
            orderModel.city
        }
        set {
            orderModel.city = newValue
        }
    }
    
    var zip: String {
        get {
            orderModel.zip
        }
        set {
            orderModel.zip = newValue
        }
    }
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        
        return true
    }
    
    var cost: Double {

        var cost = Double(quantity) * 2

        cost += (Double(type) / 2)

        if extraFrosting {
            cost += Double(quantity)
        }

        if addSprinkles {
            cost += Double(quantity) / 2
        }

        return cost
    }
    
    init() {}
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Codingkeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSprinkles, forKey: .addSprinkles)
        try container.encode(name, forKey: .name)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Codingkeys.self)
        
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)
        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
        name = try container.decode(String.self, forKey: .name)
        streetAddress = try container.decode(String.self, forKey: .streetAddress)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)
    }
    
}
