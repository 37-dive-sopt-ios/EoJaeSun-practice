//
//  ScrollView.swift
//  SwiftUI-Tutorial
//
//  Created by 어재선 on 11/22/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
            ScrollView {
                VStack(spacing: 16) {
                    ZStack {
                        Circle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 120, height: 120)
                        
                        Image(systemName: "person.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 20)
                    
                    nameWithPosition
                    ageAndMBTI
                    
                    Spacer()
                        .frame(height: 1000)
                    hobby
                    TextField("", text: Binding(projectedValue: .constant("")))
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 70)
                
            }
            .overlay(alignment: .bottom){
                directMessageButton
                    .frame(height: 50)
                    .padding()
            }
        
    }
    
    private var nameWithPosition: some View {
        HStack {
            Text("iOS")
                .font(.subheadline)
            Text("이명진")
                .font(.headline)
                .foregroundStyle(.blue)
            Spacer()
            Text("파트장")
                .foregroundStyle(.gray)
                .font(.subheadline)
        }
        .padding(.vertical, 2)
    }
    
    private var ageAndMBTI: some View {
        HStack {
            Text("97년생")
                .font(.subheadline)
            Spacer()
            Text("ESTP거나 ESTJ")
                .font(.subheadline)
                .foregroundStyle(.indigo)
        }
    }
    
    private var hobby: some View {
        Text("취미는 영상편집, 러닝, 카공 등")
    }
    
    private var directMessageButton: some View {
        Button {
            
        } label: {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.blue)
                .overlay {
                    Text("디엠 보내기")
                        .foregroundStyle(.white)
                }
        }
    }
}


#Preview {
    ProfileView()
}
