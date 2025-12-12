//
//  ContentView.swift
//  SwiftUI-Tutorial
//
//  Created by 어재선 on 11/22/25.
//

import SwiftUI

struct ChatRow: View {
    let chatRoom: ChatRoomModel
    
    var body: some View {
            HStack {
                Circle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 40, height: 40)
                    .overlay{
                        Image(systemName: "person.fill")
                            .foregroundStyle(.gray)
                    }
                Spacer()
                    .frame(width: 16)
                VStack(alignment: .leading) {
                    HStack(spacing: 4) {
                        Text(chatRoom.name)
                            .font(.headline)
                        Text(chatRoom.location)
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    Text(chatRoom.lastMessage)
                        .font(.subheadline)
                }
                Spacer()
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 40, height: 40)
                    .overlay {
                        if let image = chatRoom.thumbnail {
                            image
                        } else {
                            Image(.image5)
                                .resizable()
                                .scaledToFit()
                        }
                        
                    }
            }
        .padding()
    }
}

#Preview {
    ChatRow(chatRoom: .mockData[0])
}
