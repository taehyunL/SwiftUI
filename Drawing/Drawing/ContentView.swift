//
//  ContentView.swift
//  Drawing
//
//  Created by 이태현 on 2022/02/08.
//

import SwiftUI
struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100

    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(color(for: value, brightness: 1), lineWidth: 2)
            }
        }
    }

    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount

        if targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}
struct Arrow: Shape {
    var width: Double

    var animatableData: Double {
            get { width }
            set { width = newValue }
        }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: 0 + width/2))
        path.addLine(to: CGPoint(x: rect.maxX - width, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX + (rect.maxX - width - rect.midX)/2, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX + (rect.maxX - width - rect.midX)/2, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX - (rect.maxX - width - rect.midX)/2, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX - (rect.maxX - width - rect.midX)/2, y: rect.midY))
        path.addLine(to: CGPoint(x: width, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: 0 + width/2))
        
        return path
    }
}

struct ContentView: View {
    @State private var colorCycle = 0.0
    @State private var width = 50.0

    var body: some View {
        VStack {
            ColorCyclingRectangle(amount: colorCycle)
                .frame(width: 300, height: 300)

            Slider(value: $colorCycle)
            
            Arrow(width: width)
                .frame(width: 200, height: 100)
                .onTapGesture {
                    withAnimation {
                        width = Double.random(in: 10...40)
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
