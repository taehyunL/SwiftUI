//
//  ContentView.swift
//  BetterRest
//
//  Created by 이태현 on 2022/01/02.
//

import SwiftUI

struct ContentView: View {
    @State var date = Date.now
    @State var sleepAmount = 8.0
    @State var coffeeAmount = 1
    
    var body: some View {
        NavigationView {
            VStack {
                Text("When do you want to wake up?")
                    .font(.headline)
                DatePicker("Please enter the time", selection: $date, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
                Text("Desired amount of sleep")
                    .font(.headline)
                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12)
                
                Text("Daliy coffee intake")
                    .font(.headline)
                Stepper(coffeeAmount == 1 ? "1Cup" : "\(coffeeAmount)Cups", value: $coffeeAmount, in: 1...20)
            }
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: calculateBedTime)
            }
        }
    }
    
    func calculateBedTime() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
