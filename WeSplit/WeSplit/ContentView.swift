//
//  ContentView.swift
//  WeSplit
//
//  Created by 이태현 on 2021/12/11.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10,15,20,25,0]
    
    var body: some View {
        Form {
            Section {
                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD")).keyboardType(.default)
            }

            Section {
                Text(checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
