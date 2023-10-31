//
//  Mission.swift
//  Moonshot
//
//  Created by SCOTT CROWDER on 10/31/23.
//

import Foundation

struct CrewRole: Codable {
    let name: String
    let role: String
}

struct Mission: Codable, Identifiable {
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}
