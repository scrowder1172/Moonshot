//
//  ContentView.swift
//  Moonshot
//
//  Created by SCOTT CROWDER on 10/31/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("hello world")
    }
}

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
            .frame(width: .infinity, height: 1)
    }
}


#Preview {
    ContentView()
}
