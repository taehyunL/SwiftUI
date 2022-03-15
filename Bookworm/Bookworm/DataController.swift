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
    
    func saveCandy(name: String, shortName: String, fullName: String) {
        let candy = Candy(context: container.viewContext)
        
        candy.name = name
        
        candy.origin = Country(context: container.viewContext)
        
        candy.origin?.shortName = shortName
        candy.origin?.fullName = fullName
        
        do {
            try container.viewContext.save()
        } catch {
            print("Failed \(error)")
        }
    }
    
    func getAllCountries() -> [Country] {
        let fetchRequest = Country.fetchRequest()
        
        do {
            return try container.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
}
