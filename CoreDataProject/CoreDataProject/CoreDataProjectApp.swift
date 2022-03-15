//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by 이태현 on 2022/03/13.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
//    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView(coreDM: DataController())
        }
    }
}
