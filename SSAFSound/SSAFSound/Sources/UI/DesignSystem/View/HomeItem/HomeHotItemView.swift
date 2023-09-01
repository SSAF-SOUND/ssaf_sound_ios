//
//  HomeHotItemView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/08/21.
//

import SwiftUI

struct HomeHotItemView: View {
    
    let hotPost: HotPost
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
                .frame(width: 24)
            Rectangle()
                .frame(width: 47, height: 22)
                .cornerRadius(20)
                .foregroundColor(.whilte)
                .overlay {
                    Text(hotPost.boardTitle)
                        .font(.pretendardBold12)
                        .foregroundColor(.ssafySoundblack)
                }
            
            
            Text(hotPost.title)
                .foregroundColor(.whilte)
                .font(.pretendardRegualar14)
                .lineLimit(1)
            
            Spacer()
            
            Image(asset: .thumb_fill)
            Text("\(hotPost.likeCount)")
                .foregroundColor(.whilte)
                .font(.pretendardRegualar14)
            Spacer()
                .frame(width: 8)
            
            Image(asset: .chat_fill)

            Text("\(hotPost.commentCount)")
                .foregroundColor(.whilte)
                .font(.pretendardRegualar14)
            
            Spacer()
                .frame(width: 21)
        }
        .frame(width: .infinity)
    }
}

//struct HomeHotItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeHotItemView(hotPost: HotPost)
//            .previewLayout(.sizeThatFits)
//            .preferredColorScheme(.dark)
//    }
//}
