//
//  ViewModel.swift
//  Friendface
//
//  Created by 이태현 on 2022/03/19.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var users: [User] = []
    
    init() {
        getPost()
    }
    
    func getPost() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else { return }
                
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300,
                error == nil else {
                return
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601

            guard let newUser = try? decoder.decode([User].self, from: data) else {
                print("디코딩 오류")
                return
            }
            DispatchQueue.main.async { [weak self] in
                self?.users = newUser
            }
        }
        .resume()
    }
    
    
}
