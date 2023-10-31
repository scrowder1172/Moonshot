//
//  ImageExamples.swift
//  Moonshot
//
//  Created by SCOTT CROWDER on 10/31/23.
//

import SwiftUI

struct ImageExamples: View {
    var body: some View {
        
        //FramedImageExamples()
        //ClippedImageExamples()
        //ScaledToFillExamples()
        //ScaledToFitExamples()
        ContainerRelativeExample()
        
    }
}

struct FramedImageExamples: View {
    var body: some View {
        VStack {
            Image(.example)
                .resizable()
                .frame(width: 300, height: 100)
            Text("Framed Image")
                .font(.caption)
        }
    }
}

struct ClippedImageExamples: View {
    var body: some View {
        VStack {
            Image(.example)
                .frame(width: 300, height: 300)
                .clipped()
            Text("Framed Image")
                .font(.caption)
        }
    }
}


struct ScaledToFillExamples: View {
    var body: some View {
        VStack {
            Image(.example)
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 100)
            Text("Scale To Fill Image")
                .font(.caption)
                .offset(x: 0, y: 150)
        }
    }
}

struct ScaledToFitExamples: View {
    var body: some View {
        VStack {
            Image(.example)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .background(.black)
            Text("Scale To Fit Image")
                .font(.caption)
        }
    }
}

struct ContainerRelativeExample: View {
    var body: some View {
        VStack {
            Image(.example)
                .resizable()
                .scaledToFit()
                .containerRelativeFrame(.horizontal) { size, axis in
                    size * 0.8
                }
            Text("Container Relative 80% of Screen")
                .font(.caption)
        }
    }
}

#Preview {
    ImageExamples()
}
