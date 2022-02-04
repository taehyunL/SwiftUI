//
//  SwiftUIView.swift
//  Moonshot
//
//  Created by 이태현 on 2022/02/04.
//

import SwiftUI

struct GridView: View {
    let astronauts: [String: Astronauts]
    let missions: [Mission]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    @Binding var showingGrid: Bool
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                        .stroke()
                            )
                        }
                    }
                }
                .padding([.leading, .bottom, .trailing])
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

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        let astronauts: [String: Astronauts] = Bundle.main.decode("astronauts.json")
        let missions: [Mission] = Bundle.main.decode("missions.json")
        
        GridView(astronauts: astronauts, missions: missions, showingGrid: .constant(true))
    }
}
