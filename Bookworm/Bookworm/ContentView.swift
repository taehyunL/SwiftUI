//
//  ContentView.swift
//  Bookworm
//
//  Created by 이태현 on 2022/02/23.
//

import SwiftUI

struct PushButton: View {
    var title: String
    @Binding var isOn: Bool
    
    var onColors = [ Color.red, Color.yellow ]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
        
    }
    
}

struct ContentView: View {
    @State var rememberMe = false
    
    var body: some View {
        PushButton(title: "remember", isOn: $rememberMe)
        Text( rememberMe ? "True" : "False")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
