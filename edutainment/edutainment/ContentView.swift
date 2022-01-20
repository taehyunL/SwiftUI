//
//  ContentView.swift
//  edutainment
//
//  Created by 이태현 on 2022/01/19.
//

import SwiftUI

struct ContentView: View {
    @State var practiceNum: Int = 2
    @State var question = 1
    @State var questionNumber = [5,10,20]
    
    var body: some View {
        NavigationView {
            VStack {
                Stepper("select number", value: $practiceNum, in: 2...12)
                Text("you want to solve \(practiceNum)")
                HStack {
                    Text("The number of question is")
                    Picker("Question number", selection: $question) {
                        ForEach(0..<3) { pick in
                            Text("\(questionNumber[pick])")
                        }
                    }
                }
                Spacer()
                NavigationLink(destination: QuestionView(practiceNum: practiceNum,question: questionNumber[question])) {
                    Text("click to Solve!")
                }
                Spacer()
            }
        }
    }
}

struct QuestionView: View {
    var practiceNum: Int
    var question: Int
    
    var body: some View {
        VStack {
            List(0 ..< question) { _ in
                Text(" \(practiceNum) * \(Int.random(in: 1...12)) = ? ")
            }
            Text("Score =")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
