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
                    Picker("select your cupcake", selection: $order.orderModel.type) {
                        ForEach(OrderModel.types.indices) {
                            Text(OrderModel.types[$0])
                        }
                    }
                    Stepper("Number of cakes = \(order.orderModel.quantity)", value: $order.orderModel.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("anyting else?", isOn: $order.orderModel.specialRequestEnabled.animation())
                    
                    if order.orderModel.specialRequestEnabled {
                        Toggle("add extra frosting", isOn: $order.orderModel.extraFrosting)
                        Toggle("add extra sprinkles", isOn: $order.orderModel.addSprinkles)
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
