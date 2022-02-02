//
//  AstronautsView.swift
//  Moonshot
//
//  Created by 이태현 on 2022/02/02.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronauts
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()

                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautsView_Previews: PreviewProvider {
    static let astronaut: [String: Astronauts] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronaut["aldrin"]!)
            .preferredColorScheme(.dark)
    }
}
