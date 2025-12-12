//
//  NavigationPathEample.swift
//  SwiftUI-Tutorial
//
//  Created by 어재선 on 11/29/25.
//

import SwiftUI

struct NavigationPathExmeple: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 10) {
                Text("홈 화면")
                    .font(.largeTitle)
                
                Button("뷰 이동") {
                    path.append(1)
                }
            }
            .navigationDestination(for: Int.self) { step in
                StepView(step: step, path: $path)
            }
        }.navigationTitle("하이")
        
        
    }
}

struct StepView: View {
    let step: Int
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack(spacing: 20) {
            Text("\(step)단계")
                .font(.largeTitle)
            
            Button("다음으로") {
                path.append(step + 1)
            }
            
            Button("처음으로") {
                path = NavigationPath()
            }
        }
    }
}

#Preview {
    NavigationStack {
        NavigationPathExmeple()
    }
    
}
