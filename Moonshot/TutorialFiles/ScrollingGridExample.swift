//
//  ScrollingGridExample.swift
//  Moonshot
//
//  Created by SCOTT CROWDER on 10/31/23.
//

import SwiftUI

struct ScrollingGridExample: View {
    
    let fixedLayout = [
        GridItem(.fixed(80)),
        GridItem(.fixed(80)),
        GridItem(.fixed(80))
    ]
    
    let adaptiveLayout = [
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Fixed Size Horizontal Grid") {
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: fixedLayout) {
                            ForEach(0..<1000) {
                                Text("Item \($0)")
                            }
                        }
                    }
                }
                
                NavigationLink("Fixed Size Vertical Grid") {
                    ScrollView {
                        LazyVGrid(columns: fixedLayout) {
                            ForEach(0..<1000) {
                                Text("Item \($0)")
                            }
                        }
                    }
                }
                
                NavigationLink("Dynamic Size Horizontal Grid") {
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: adaptiveLayout) {
                            ForEach(0..<1000) {
                                Text("Item \($0)")
                            }
                        }
                    }
                }
                
                NavigationLink("Dynamic Size Vertical Grid") {
                    ScrollView {
                        LazyVGrid(columns: adaptiveLayout) {
                            ForEach(0..<1000) {
                                Text("Item \($0)")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Scrolling Grid Views")
        }
    }
}

#Preview {
    ScrollingGridExample()
}
