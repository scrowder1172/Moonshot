//
//  CrewScrollView.swift
//  Moonshot
//
//  Created by SCOTT CROWDER on 11/2/23.
//

import SwiftUI

struct CrewScrollView: View {
    let crew: [MissionView.CrewMember]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink (value: crewMember.astronaut) {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                Text(crewMember.role == "Commander" ? crewMember.role.uppercased() :
                                        crewMember.role.capitalized )
                                    .foregroundStyle(.white.opacity(0.5))
                                    .font(.callout)
                            }
                        }
                        .padding(.horizontal)
                        .navigationDestination(for: Astronaut.self) {astronaut in
                            AstronautView(astronaut: crewMember.astronaut)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    var crew: [MissionView.CrewMember]
    
    crew = missions[0].crew.map { memberOfMissionCrew in
        if let astronaut = astronauts[memberOfMissionCrew.name] {
            return MissionView.CrewMember(role: memberOfMissionCrew.role, astronaut: astronaut)
        } else {
            fatalError("Missing \(memberOfMissionCrew.name)")
        }
    }
    
    return CrewScrollView(crew: crew)
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
