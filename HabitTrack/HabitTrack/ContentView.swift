//
//  ContentView.swift
//  HabitTrack
//
//  Created by 이태현 on 2022/02/14.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var playerActivites = Activities()
    @AppStorage("tapCount") private var tapCount = 0
    let habitList = ["study", "cycle", "youtube", "baseball", "game"]
    let habitText = ["learn about ...", "riding", "watching", "MLB", "maple"]
    
    var body: some View {
        NavigationView {
            VStack {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(0..<habitList.count) { habit in
                        Text("\(habitList[habit])")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .onTapGesture {
                                tapCount += 1
                                let habitName = habitList[habit]
                                let habitExp = habitText[habit]
                                
                                playerActivites.addActivites(name: habitName, detail: habitExp)
                            }
                    }
                }
                ScrollView() {
                    ForEach(playerActivites.activities) { player in
                        NavigationLink {
                            Text("\(player.detail)")
                        } label: {
                            Text(" \(player.name)")
                                .frame(maxWidth: .infinity)
                        }
                    }
                }
            
            }
            .navigationTitle("\(tapCount)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
