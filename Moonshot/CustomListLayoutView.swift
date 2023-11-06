//
//  CustomListLayoutView.swift
//  Moonshot
//
//  Created by SCOTT CROWDER on 11/2/23.
//

import SwiftUI

struct CustomListLayout: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(missions) {mission in
                    MissionNavLink(astronauts: astronauts, mission: mission, showGridView: false)
                    .listRowBackground(Color.darkBackground)
                }
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    return CustomListLayout(astronauts: astronauts, missions: missions)
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
