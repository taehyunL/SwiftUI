//
//  ListView.swift
//  Moonshot
//
//  Created by 이태현 on 2022/02/04.
//

import SwiftUI

struct ListView: View {
    let astronauts: [String: Astronauts]
    let missions: [Mission]
    
    @Binding var showingGrid: Bool
    
    var body: some View {
        NavigationView {
            List {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        HStack {
                            Spacer()
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 100)
                            Spacer()
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(.bottom, 3)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Moonshoot")
            .background(.darkBackground)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("switching view") {
                        showingGrid.toggle()
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        let astronauts: [String: Astronauts] = Bundle.main.decode("astronauts.json")
        let missions: [Mission] = Bundle.main.decode("missions.json")
        
        ListView(astronauts: astronauts, missions: missions, showingGrid: .constant(true))
    }
}
