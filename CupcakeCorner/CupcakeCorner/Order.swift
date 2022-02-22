//
//  File.swift
//  CupcakeCorner
//
//  Created by 이태현 on 2022/02/20.
//

import SwiftUI

class Order: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case orderModel
    }

    @Published var orderModel = OrderModel()

    init() { }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        orderModel = try container.decode(OrderModel.self, forKey: .orderModel)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(orderModel, forKey: .orderModel)
    }
    
}
