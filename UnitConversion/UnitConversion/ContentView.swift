//
//  ContentView.swift
//  UnitConversion
//
//  Created by 이태현 on 2021/12/14.
//

import SwiftUI

struct ContentView: View {
    @State var number = 0
    @State var time = "seconds"
    
    let times = ["seconds", "minutes", "hours", "days"]
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Input number", value: $number, format: .number)
                        .keyboardType(.decimalPad)
                    Picker("select",selection: $time) {
                        ForEach(times, id: \.self) {
                            Text("\($0)")
                        }
                    }
                } header: {
                    Text("enter a number")
                }
                Section {
                    if time == "seconds" {
                        Text(number, format: .number)
                    } else if time == "minutes" {
                        Text(number * 60, format: .number)
                    } else if time == "hours" {
                        Text(number * 3600, format: .number)
                    } else {
                        Text(number * 3600 * 24, format: .number)
                    }
                } header: {
                    Text("seconds")
                }
                Section {
                    if time == "seconds" {
                        Text(number / 60, format: .number)
                    } else if time == "minutes" {
                        Text(number, format: .number)
                    } else if time == "hours" {
                        Text(number * 60, format: .number)
                    } else {
                        Text(number * 60 * 24, format: .number)
                    }
                } header: {
                    Text("minutes")
                }
                Section {
                    if time == "seconds" {
                        Text(number / 3600, format: .number)
                    } else if time == "minutes" {
                        Text(number / 60, format: .number)
                    } else if time == "hours" {
                        Text(number, format: .number)
                    } else {
                        Text(number * 24, format: .number)
                    }
                } header: {
                    Text("hours")
                }
                Section {
                    if time == "seconds" {
                        Text(number / 24 / 3600, format: .number)
                    } else if time == "minutes" {
                        Text(number / 24 / 60, format: .number)
                    } else if time == "hours" {
                        Text(number / 24, format: .number)
                    } else {
                        Text(number, format: .number)
                    }
                } header: {
                    Text("days")
                }
            }
            .navigationTitle("Unit Conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
