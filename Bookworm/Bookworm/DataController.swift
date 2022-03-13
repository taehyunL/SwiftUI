//
//  DataController.swift
//  Bookworm
//
//  Created by 이태현 on 2022/02/24.
//
import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataProject")//data load and store
    
    init () {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data fail to load : \(error.localizedDescription)")
                return
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump
        }
    }
}
