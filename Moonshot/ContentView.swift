//
//  ContentView.swift
//  Moonshot
//
//  Created by SCOTT CROWDER on 10/31/23.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showingGrid: Bool = true
    
    var body: some View {
        NavigationStack {
            Group {
                if showingGrid {
                    CustomGridLayout(astronauts: astronauts, missions: missions)
                } else {
                    
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button("Switch View") {
                    showingGrid.toggle()
                }
            }
        }
    }
}




#Preview {
    ContentView()
}
