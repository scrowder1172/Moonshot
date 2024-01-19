//
//  MissionView.swift
//  Moonshot
//
//  Created by SCOTT CROWDER on 11/1/23.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView{
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) {width, axis in
                        width * 0.6
                    }
                    .padding(.top)
                    .accessibilityLabel(mission.badge)
                
                Text("Launch Date: \(mission.launchDate?.formatted(date: .long, time: .omitted) ?? mission.formattedLaunchDate)")
                    .font(.title2)
                    .padding(.top, 20)

                
                VStack(alignment: .leading) {
                    HorizontalLine()
                        .padding(.vertical)
                        .foregroundStyle(.lightBackground)
                    
                    Text("Mission Highlights")
                        .font(.title.bold())
                    
                    Text(mission.description)
                    
                    HorizontalLine()
                        .padding(.vertical)
                        .foregroundStyle(.lightBackground)
                    
                    Text("Crew Members")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                }
                .padding(.horizontal)
                
                CrewScrollView(crew: crew)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { memberOfMissionCrew in
            if let astronaut = astronauts[memberOfMissionCrew.name] {
                return CrewMember(role: memberOfMissionCrew.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(memberOfMissionCrew.name)")
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
