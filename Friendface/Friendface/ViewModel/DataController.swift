//
//  DataController.swift
//  Friendface
//
//  Created by 이태현 on 2022/03/22.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "DataModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                print("core data 가져오기 오류  \(error.localizedDescription)")
            }
        }
    }
    
    func saveData(user: User) {
        let cachedUser = CachedUser(context: persistentContainer.viewContext)
        
        cachedUser.name = user.name
        cachedUser.isActive = user.isActive
        cachedUser.address = user.address
        cachedUser.id = user.id
        cachedUser.age = Int16(user.age)
        cachedUser.email = user.email
        cachedUser.company = user.company
        cachedUser.registered = user.registered
        cachedUser.about = user.about
        let str = user.tags.joined(separator: ",")
        cachedUser.tags = str
        
        for friend in user.friends {
            let cachedFriend = CachedFriend(context: persistentContainer.viewContext)
            cachedFriend.id = friend.id
            cachedFriend.name = friend.name
            cachedUser.addToFriend(cachedFriend)
        }
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("save error")
        }
    }
    
    func getAllUsers() -> [CachedUser] {
        let fetchRequest = CachedUser.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
}
