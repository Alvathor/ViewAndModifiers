//
//  ContentViewTree.swift
//  ViewAndModifiers
//
//  Created by Juliano Goncalves Alvarenga on 16/11/19.
//  Copyright © 2019 Ciclic. All rights reserved.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0 ..< rows) { row in
                HStack {
                    ForEach(0 ..< self.columns) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
    
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping(Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}

struct ContentViewTree: View {
    var body: some View {
        
        VStack(spacing: 30) {
            // Without the implicit HStack
            GridStack(rows: 4, columns: 4) { row, col in
                HStack {
                    Image(systemName: "\(row * 4 + col).circle")
                    Text("R\(row) C\(col)")
                }
            }
            
            // With the implicit HStack from custom init, "escaping" holdes a closure to be use latter on
            GridStack(rows: 4, columns: 4) { row, col in
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row) C\(col)")
            }
        }
    }
}

struct ContentViewTree_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewTree()
    }
}
