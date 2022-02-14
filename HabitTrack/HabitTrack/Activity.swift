//
//  Activity.swift
//  HabitTrack
//
//  Created by 이태현 on 2022/02/14.
//

import Foundation

struct Activity: Codable, Identifiable, Equatable {
    var id = UUID()
    let name: String
    let detail: String
    
}
