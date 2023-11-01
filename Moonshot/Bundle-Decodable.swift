//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by SCOTT CROWDER on 10/31/23.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let fileData = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(T.self, from: fileData) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return decodedData
    }
}
