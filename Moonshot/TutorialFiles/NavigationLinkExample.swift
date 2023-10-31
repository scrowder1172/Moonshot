//
//  NavigationLinkExample.swift
//  Moonshot
//
//  Created by SCOTT CROWDER on 10/31/23.
//

import SwiftUI

struct NavigationLinkExample: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                Text("Detail View")
            } label: {
                VStack {
                    Text("This is the label")
                    Text("So is this")
                    Image(systemName: "face.smiling")
                }
                .font(.largeTitle)
            }
            .navigationTitle("SwiftUI")
            List {
                ForEach(0..<100) {
                    NavigationLink("Item \($0)") {
                        List {
                            ForEach(0..<100) {
                                NavigationLink("SubItem \($0)") {
                                    Text("This is the sub item's sub item")
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationLinkExample()
}
