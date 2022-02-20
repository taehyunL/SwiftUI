//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by 이태현 on 2022/02/20.
//

import SwiftUI

struct AddressView: View {
    @StateObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("name", text: $order.name)
                TextField("street address", text: $order.streetAddress)
                TextField("city", text: $order.city)
                TextField("zip", text: $order.zip)
            }
            
            Section {
                NavigationLink {
                    CheckOut(order: order)
                } label: {
                    Text("Check Out")
                }
            }
            .disabled(order.hasValidAddress == false)
        }
        .navigationTitle("delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
