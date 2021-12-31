//
//  ContentView.swift
//  R_P_S
//
//  Created by 이태현 on 2021/12/31.
//

import SwiftUI

struct ContentView: View {
    @State private var pickes = ["rock", "paper", "scissors"]
    @State private var pickIndex = Int.random(in: 0...2)
    @State private var score = 0
    @State private var isWin = Bool.random()
    @State var showingScore = false
    @State private var count = 0
    
    var body: some View {
        VStack {
            Text("score = \(score)")
            Spacer()
            Text(pickes[pickIndex])
            Text( isWin ? "win" : "lose")
            Spacer()
            HStack {
                ForEach(pickes, id: \.self) { picker in
                    Button {
                        pickResult(picker)
                    } label: {
                        Text(picker)
                            .font(.largeTitle)
                            .padding()
                    }
                }
            }
        }
        .font(.system(size: 40))
        .alert("result",isPresented: $showingScore) {
        } message: {
            Text("your final score is \(score)")
        }
    }
    
    func pickResult(_ picker: String) {
        count += 1
        if count == 10 {
            showingScore = true
            count = 0
            score = 0
        }
        if isWin {
            if pickes[(pickIndex + 1) % 3] == picker {
                score += 10
            }
            else {
                score -= 10
            }
        } else {
            if pickes[(pickIndex + 3 - 1) % 3] == picker {
                score += 10
            }
            else {
                score -= 10
            }
        }
        pickIndex = Int.random(in: 0...2)
        isWin = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
