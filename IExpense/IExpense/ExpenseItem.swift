//
//  ExpenseItem.swift
//  IExpense
//
//  Created by 이태현 on 2022/01/24.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
