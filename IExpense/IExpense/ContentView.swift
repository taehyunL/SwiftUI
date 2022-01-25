//
//  ContentView.swift
//  IExpense
//
//  Created by 이태현 on 2022/01/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        if item.amount < 10 {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }

                            Spacer()
                        
                            Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        } else if item.amount < 100 {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            .foregroundColor(.blue)

                            Spacer()
                        
                            Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        } else {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            .foregroundColor(.pink)

                            Spacer()
                        
                            Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
