//
//  CheckOut.swift
//  CupcakeCorner
//
//  Created by 이태현 on 2022/02/20.
//

import SwiftUI

struct CheckOut: View {
    @StateObject var order: Order
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total is \(order.cost, format: .currency(code: "USD"))")
                            .font(.title)

                        Button("Place Order", action: { })
                            .padding()
            }
        }
        .navigationTitle("Check Out")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckOut_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckOut(order: Order())
        }
    }
}
