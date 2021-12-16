//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by 이태현 on 2021/12/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }
            Text("Your Content")
                .foregroundColor(.secondary)
                .padding()
                .background(.ultraThinMaterial)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
