//
//  SelectedItemView.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/16.
//

import SwiftUI

struct HotBoardItemView: View {
    let hotPost: HotPost
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            HStack(alignment: .bottom) {
                Text(hotPost.boardTitle)
                    .manropeFont(family: .Bold, size: 12)
                    .foregroundColor(.pointPurple)
                Spacer()
                boardInteractionStatsView(likeCount: hotPost.likeCount, commentCount: hotPost.commentCount)
            }
            Text(hotPost.title)
                .manropeFont(family: .Bold, size: 14)
                .lineLimit(1)
                .foregroundColor(.basicWhite)
                .padding(.bottom,12)
            Text(hotPost.content)
                .manropeFont(family: .Regular, size: 14)
                .foregroundColor(.basicWhite)
                .lineLimit(1)
            Text(hotPost.createdAt)
                .manropeFont(family: .Bold, size: 14)
                .foregroundColor(.basicWhite)
        }.padding(EdgeInsets(top: 14, leading: 22, bottom: 14, trailing: 22))
            .frame(height: 123)
            .background(Color.basicBlack)
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(Color.fontBlueBlack, lineWidth: 1)
            )
    }
    @ViewBuilder
    private func boardInteractionStatsView(likeCount: Int, commentCount: Int
    ) -> some View {
        HStack(alignment: .center, spacing: 4){
            HStack(alignment: .center, spacing: 4){
                Image(asset: .thumb)
                    .resizable()
                    .frame(width: 20,height: 20)
                    .aspectRatio(contentMode: .fit)
                    .colorMultiply(.primaryDefault)
                    .padding(.bottom,3)
                Text("\(likeCount)")
                    .manropeFont(family: .Bold, size: 13)
                    .foregroundColor(.primaryDefault)
            }
            HStack(alignment: .center,spacing: 4){
                Image(asset: .message)
                    .resizable()
                    .frame(width: 20,height: 20)
                    .aspectRatio(contentMode: .fit)
                    .colorMultiply(.secondaryDefault)
                Text("\(commentCount)")
                    .manropeFont(family: .Bold, size: 13)
                    .foregroundColor(.secondaryDefault)
            }
        }
    }
}

//struct HotBoardItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        HotBoardItemView(hotPost: HotPost)
//    }
//}
