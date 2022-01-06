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
    
    func test() {
        let input = """
                    a
                    b
                    c
                    """
        let letters = input.components(separatedBy: "\n")
        let letter = letters.randomElement()
        
        let trimmend = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
