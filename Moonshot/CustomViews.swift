//
//  CustomViews.swift
//  Moonshot
//
//  Created by SCOTT CROWDER on 11/2/23.
//

import SwiftUI

struct CustomButton: View {
    let label: String
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Text(label)
        }
        .frame(width: 200, height: 30)
        .background(.blue)
        .foregroundStyle(.white)
        .bold()
        .clipShape(.rect(cornerRadius: 20))
    }
}

struct HorizontalLine: View {
    var body: some View {
        Rectangle()
            .frame(height: 1)
    }
}


struct MissionNavLink: View {
    let astronauts: [String: Astronaut]
    let mission: Mission
    let showGridView: Bool
    
    var body: some View {
        NavigationLink {
            MissionView(mission: mission, astronauts: astronauts)
        } label: {
            if showGridView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding()
                    VStack {
                        Text(mission.displayName)
                            .font(.headline)
                            .foregroundStyle(.white)
                        Text(mission.formattedLaunchDate)
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.5))
                    }
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(.lightBackground)
                }
                .clipShape(.rect(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.lightBackground)
                )
                .accessibilityElement()
                .accessibilityLabel("\(mission.displayName). Launch date: \(mission.formattedLaunchDate)")
            } else {
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
                    .accessibilityElement()
                    .accessibilityLabel("\(mission.displayName). Launch date: \(mission.formattedLaunchDate)")
                }
        }
        
    }
}

