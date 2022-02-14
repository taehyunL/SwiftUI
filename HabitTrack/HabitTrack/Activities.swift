//
//  Activities.swift
//  HabitTrack
//
//  Created by 이태현 on 2022/02/14.
//

import Foundation

class Activities: ObservableObject {
    @Published var activities = [Activity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "activities")
            }
        }
    }
    init() {
            if let savedItem = UserDefaults.standard.data(forKey: "activities") {
                if let decodedItems = try? JSONDecoder().decode([Activity].self, from: savedItem) {
                    
                    activities = decodedItems
                    return
                }
            }
            
            activities = []
        }
    
    func addActivites(name: String, detail: String) {
        let activity = Activity(name: name, detail: detail)
        activities.append(activity)
    }
}
