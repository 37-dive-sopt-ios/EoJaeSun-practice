//
//  ChatRow.swift
//  SwiftUI-Tutorial
//
//  Created by 어재선 on 11/22/25.
//

import SwiftUI

import SwiftUI

struct ChatList: View {
    let chatRooms: [ChatRoomModel]

    var body: some View {
        List(chatRooms) { chatRoom in
            ChatRow(chatRoom: chatRoom)
                .listRowInsets(EdgeInsets()) // inset 타이트하게 맞춰줍니다.
                .listRowSeparator(.visible)
                .alignmentGuide(.listRowSeparatorLeading ) { viewDimensions in
                    return -viewDimensions.width
                    
                }
        }
        .listStyle(.plain) // 기본 스타일
    }
}

#Preview {
    ChatList(chatRooms: ChatRoomModel.mockData)
}
