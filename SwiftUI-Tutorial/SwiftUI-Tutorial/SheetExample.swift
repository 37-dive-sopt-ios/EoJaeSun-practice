//
//  SheetExample.swift
//  SwiftUI-Tutorial
//
//  Created by 어재선 on 11/29/25.
//

import SwiftUI

struct SheetExample: View {
    @State private var showSheet: Bool = false
    
    var body: some View {
        VStack {
            Text("홈화면")
            
            Button("시트 열기") {
                showSheet = true
            }
        }.sheet(isPresented: $showSheet) {
            EmptyView()
        }
    }
}

#Preview {
    SheetExample()
}
