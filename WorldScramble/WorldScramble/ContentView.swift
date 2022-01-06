//
//  ContentView.swift
//  WorldScramble
//
//  Created by 이태현 on 2022/01/06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Section {
                Text("row 1")
                Text("row 2")
            }
            
            ForEach(3..<5) {
                Text("row \($0)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
