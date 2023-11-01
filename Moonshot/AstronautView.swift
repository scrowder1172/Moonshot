//
//  AstronautView.swift
//  Moonshot
//
//  Created by SCOTT CROWDER on 11/1/23.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        VStack {
            Image(astronaut.id)
                .resizable()
                .scaledToFit()
            ScrollView {
                Text(astronaut.description)
                .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return AstronautView(astronaut: astronauts["aldrin"]!)
        .preferredColorScheme(.dark)
}
