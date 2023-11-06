//
//  CustomGridLayoutView.swift
//  Moonshot
//
//  Created by SCOTT CROWDER on 11/2/23.
//

import SwiftUI

struct CustomGridLayout: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns){
                ForEach(missions) {mission in
                    MissionNavLink(astronauts: astronauts, mission: mission, showGridView: true)
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    return CustomGridLayout(astronauts: astronauts, missions: missions)
}
