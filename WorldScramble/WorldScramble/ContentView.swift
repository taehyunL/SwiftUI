//
//  ContentView.swift
//  WorldScramble
//
//  Created by 이태현 on 2022/01/06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello World")
            .padding()
    }
    
    func loadFile() {
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
