//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by 이태현 on 2021/12/16.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }
        .alert("ImportantMessage", isPresented: $showingAlert) {
            Button("cancle", role: .cancel) {}
            Button("destructive", role: .destructive) {}
        } message: {
            Text("choose")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
