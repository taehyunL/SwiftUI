//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by 이태현 on 2022/01/31.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [String : Astronauts] {
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode([String : Astronauts].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}
