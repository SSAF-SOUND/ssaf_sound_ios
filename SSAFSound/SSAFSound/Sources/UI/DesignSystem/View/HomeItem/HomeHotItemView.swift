//
//  HomeHotItemView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/08/21.
//

import SwiftUI

struct HomeHotItemView: View {
    var board: String
    var title: String
    var likeCount: Int
    var commentCount: Int
    
    var body: some View {
        HStack(alignment: .top) {
            Spacer()
                .frame(width: 24)
            Rectangle()
                .frame(width: 47, height: 22)
                .cornerRadius(20)
                .foregroundColor(.whilte)
                .overlay {
                    Text(board)
                        .font(.pretendardBold12)
                }
            
            
            Text(title)
                .foregroundColor(.whilte)
                .font(.pretendardRegualar14)
            
            Spacer()
            
            Image(asset: .thumb_fill)
            Text("\(likeCount)")
                .foregroundColor(.whilte)
                .font(.pretendardRegualar14)
            Spacer()
                .frame(width: 8)
            
            Image(asset: .chat_fill)

            Text("\(commentCount)")
                .foregroundColor(.whilte)
                .font(.pretendardRegualar14)
            
            Spacer()
                .frame(width: 21)
        }
        .frame(width: .infinity)
    }
}

struct HomeHotItemView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHotItemView(board: "취업", title: "점메추 해주라", likeCount: 1, commentCount: 1)
    }
}
