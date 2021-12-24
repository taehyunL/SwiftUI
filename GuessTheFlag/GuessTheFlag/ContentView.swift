//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by 이태현 on 2021/12/16.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var countTap = 0
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Spacer()
                Text("Guess The Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack() {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text((countries[correctAnswer]))
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            flagImage(number)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Text(" score : \(score)")
                    .textModifier()
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            if countTap < 8 {
                Button("continue", action: askQuestion)
            } else {
                Button("restart", action: askQuestion)
            }
        } message: {
            if countTap < 8 {
                Text("your score is \(score)")
            } else {
                Text("your final score is \(score)")
            }
        }
    }
    
    func flagImage(_ number: Int) -> some View {
        Image(countries[number])
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
    
    func flagTapped(_ number: Int) {
        countTap += 1
        if number == correctAnswer {
            if countTap < 8 {
                scoreTitle = "Correct"
            } else {
                scoreTitle = "Finish"
            }
            score += 10
        } else {
            if countTap < 8 {
            scoreTitle = "Wrong!\nthat's the flag of \(countries[number])"
            } else {
                scoreTitle = "Finish"
            }
            score -= 10
        }
        showingScore = true
    }
    
    func askQuestion() {
        if countTap < 8 {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        } else {
            countTap = 0
            score = 0
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        }
    }
}

struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.blue)
            .font(.largeTitle.bold())
            .padding()

    }
}

extension View {
    func textModifier() -> some View {
        modifier(TextModifier())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
