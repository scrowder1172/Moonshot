//
//  ScrollViewExample.swift
//  Moonshot
//
//  Created by SCOTT CROWDER on 10/31/23.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        self.text = text
        print(text)
    }
}

struct ScrollViewExample: View {
    var body: some View {
        VStack {
            ScrollView (.horizontal) {
                HStack {
                    ForEach(0..<100) {
                        Text("Item \($0)")
                            .font(.title)
                    }
                }
                .frame(minHeight: 100)
                .padding(.horizontal, 20)
            }
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(0..<100) {
                        CustomText("Regular Item \($0)")
                    }
                }
                .frame(maxWidth: .infinity)
                
            }
            Rectangle()
                .frame(width: .infinity, height: 1)
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(0..<100) {
                        CustomText("Lazy Item \($0)")
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        
    }
}

#Preview {
    ScrollViewExample()
}
