//
//  ContentViewTwo.swift
//  ViewAndModifiers
//
//  Created by Juliano Goncalves Alvarenga on 16/11/19.
//  Copyright © 2019 Ciclic. All rights reserved.
//

import SwiftUI

struct ContentViewTwo: View {
    
    var body: some View {
        
        Button("Hellow") {
            print(type(of: self.body))
        }.foregroundColor(.white)
            .frame(width: 300, height: 300)
            .background(RadialGradient(gradient: Gradient(colors: [.red, .blue, .yellow]), center: .center, startRadius: 50, endRadius: 80).edgesIgnoringSafeArea(.all))
            .clipShape(Circle())
        
        
    }
    
    struct ContentViewTwo_Previews: PreviewProvider {
        static var previews: some View {
            ContentViewTwo()
        }
    }
}
