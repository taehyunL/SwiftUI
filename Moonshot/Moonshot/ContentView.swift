//
//  ContentView.swift
//  Moonshot
//
//  Created by 이태현 on 2022/01/26.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronauts] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    @State var showingGrid: Bool = true
    
    var body: some View {
        if showingGrid {
            GridView(astronauts: astronauts, missions: missions, showingGrid: $showingGrid)
        } else {
            ListView(astronauts: astronauts, missions: missions, showingGrid: $showingGrid)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
