//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by 이태현 on 2022/02/17.
//

import SwiftUI

    
struct ContentView: View {
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("select your cupcake", selection: $order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    Stepper("Number of cakes = \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("anyting else?", isOn: $order.specialRequestEnable.animation())
                    
                    if order.specialRequestEnable {
                        Toggle("add extra frosting", isOn: $order.extraFrosting)
                        Toggle("add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
