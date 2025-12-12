//
//  GridView.swift
//  SwiftUI-Tutorial
//
//  Created by 어재선 on 11/29/25.
//

import SwiftUI

struct GridView: View {
    var body: some View {
        Grid(horizontalSpacing: 1, verticalSpacing: 1) {
            GridRow {
                Text("Row 1")
                    .frame(width: 100)
                
                ForEach(0..<2) { _ in
                    RoundedRectangle(cornerRadius: 4)
                        .foregroundStyle(.red)
                        .frame(width: 40,height: 40)
                }
            }
            GridRow {
                Text("Row 2")
                ForEach(0..<5) { _ in
                    RoundedRectangle(cornerRadius: 4)
                        .foregroundStyle(.green)
                        .frame(width: 40,height: 40)
                }
            }
            GridRow {
                Text("Row 3")
                ForEach(0..<4) { _ in
                    RoundedRectangle(cornerRadius: 4)
                        .foregroundStyle(.blue)
                        .frame(width: 40,height: 40)
                }
            }
        }
    }
}

#Preview {
    GridView()
}
