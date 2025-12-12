//
//  LazyVGridExampleView.swift
//  SwiftUI-Tutorial
//
//  Created by 어재선 on 11/29/25.
//

import SwiftUI

struct LazyVGridExampleView: View {
    let colums = [
        GridItem(
            .flexible()
        ), GridItem(
            .flexible()
        ),
        GridItem(
            .flexible()
        ),GridItem(
            .flexible()
        )
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: colums) {
                ForEach(0x1f600...0x1f679, id: \.self) { value in
                    Text(String(format: "%x", value))
                    Text(emoji(value))
                        .font(.largeTitle)
                    
                }
            }
        }
        
    }
    private func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }
}

#Preview {
    LazyVGridExampleView()
}
