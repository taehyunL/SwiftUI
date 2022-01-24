//
//  Expenses.swift
//  IExpense
//
//  Created by 이태현 on 2022/01/24.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItem = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItem) {
                
                items = decodedItems
                return
            }
        }
        
        items = []
    }
    
}
