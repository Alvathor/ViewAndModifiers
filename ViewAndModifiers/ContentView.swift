//
//  ContentView.swift
//  ViewAndModifiers
//
//  Created by Juliano Goncalves Alvarenga on 16/11/19.
//  Copyright © 2019 Ciclic. All rights reserved.
//

import SwiftUI

struct CaptuleText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .padding()
            .foregroundColor(.white)
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct WaterMark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
    
    func waterMark(with text: String) -> some View {
        self.modifier(WaterMark(text: text))
    }
}

struct ContentView: View {
    
    var body: some View {
        ZStack {
            Color.yellow.edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                CaptuleText(text: "Hello World")
                CaptuleText(text: "I'm here")
                Text("With modifier and View extension")
                    .titleStyle()
                    .waterMark(with: "Juliano Alvarenga")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



