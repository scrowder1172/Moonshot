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
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(missions) {mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 75, height: 75)
                                .padding()
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                            }
                        }
                    }
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
}
