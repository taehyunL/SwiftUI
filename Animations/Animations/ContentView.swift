//
//  ContentView.swift
//  Animations
//
//  Created by 이태현 on 2022/01/11.
//

import SwiftUI

struct ContentView: View {
    @State private var enable = false
    
    var body: some View {
        Button("Tap me") {
            enable.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enable ? .blue : .red)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enable ? 60 : 0))
        .animation(.default, value: enable)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
