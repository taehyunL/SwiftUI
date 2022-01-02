//
//  ContentView.swift
//  BetterRest
//
//  Created by 이태현 on 2022/01/02.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    
    var body: some View {
        DatePicker("please enter the date", selection: $wakeUp, in: Date.now...)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
