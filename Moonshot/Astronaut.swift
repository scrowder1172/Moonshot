//
//  Astronaut.swift
//  Moonshot
//
//  Created by SCOTT CROWDER on 10/31/23.
//

import Foundation

struct Astronaut: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let description: String
}
