//
//  ContentView.swift
//  BetterRest
//
//  Created by 이태현 on 2022/01/02.
//
import CoreML
import SwiftUI

struct ContentView: View {
    @State var wakeUp = defaultWakeUpTime
    @State var sleepAmount = 8.0
    @State var coffeeAmount = 1
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeUpTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        NavigationView {
            Form {
                VStack(alignment: .leading, spacing: 0) {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    DatePicker("Please enter the time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .onChange(of: wakeUp) { _ in
                            calculateBedTime()
                        }
                }
                VStack(alignment: .leading, spacing: 0) {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    Picker("sleep amount = \(sleepAmount.formatted())", selection: $sleepAmount) {
                        ForEach(4..<13) {
                            Text($0, format: .number)
                        }
                    }
                    .onChange(of: sleepAmount) { _ in
                        calculateBedTime()
                    }
                }
                VStack(alignment: .leading, spacing: 0) {
                    Text("Daliy coffee intake")
                        .font(.headline)
                    Stepper(coffeeAmount == 1 ? "1Cup" : "\(coffeeAmount)Cups", value: $coffeeAmount, in: 1...20)
                        .onChange(of: coffeeAmount) { _ in
                            calculateBedTime()
                        }
                }
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(alertTitle)")
                    Text("\(alertMessage)")
                }
                .font(.system(size: 20).bold())
            }
            .onAppear {
                calculateBedTime()
            }
            .navigationTitle("BetterRest")
        }
    }
    
    func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)

            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal bedtime is…"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        showingAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
