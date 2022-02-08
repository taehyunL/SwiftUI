//
//  ContentView.swift
//  Drawing
//
//  Created by 이태현 on 2022/02/08.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.closeSubpath()
        
        return path
    }
}

struct Arc: Shape {
    let startAngle: Angle
    let endAngel: Angle
    let clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle - Angle.degrees(90), endAngle: endAngel - Angle.degrees(90), clockwise: !clockwise)
        
        return path
    }
}

struct ContentView: View {
    var body: some View {
        Arc(startAngle: Angle.degrees(0), endAngel: Angle.degrees(110), clockwise: true)
            .stroke(.blue, lineWidth: 10)
            .frame(width: 100, height: 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
