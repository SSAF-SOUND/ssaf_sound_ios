//
//  SelectedItemView.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/16.
//

import SwiftUI

struct HotBoardItemView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            HStack(alignment: .bottom) {
                Text("00게시판")
                    .manropeFont(family: .Bold, size: 12)
                    .foregroundColor(.purplePoint)
                Spacer()
                boardInteractionStatsView(likeCount: 10,commentCount: 10)
            }
            Text("제목 위치제목 위치제목 위치제목 위치제목 위치제목 위치제목 위치제목 위치제목 위치제목 위치")
                .manropeFont(family: .Bold, size: 14)
                .lineLimit(1)
                .foregroundColor(.white)
                .padding(.bottom,12)
            Text("게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용")
                .manropeFont(family: .Regular, size: 14)
                .foregroundColor(.white)
                .lineLimit(1)
            Text("n분전 | 게시자")
                .manropeFont(family: .Bold, size: 14)
                .foregroundColor(.white)
        }.padding(EdgeInsets(top: 14, leading: 22, bottom: 14, trailing: 22))
            .frame(height: 123)
            .background(Color.ssafySoundblack)
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(Color(red: 0.53, green: 0.56, blue: 0.66), lineWidth: 1)
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

struct HotBoardItemView_Previews: PreviewProvider {
    static var previews: some View {
        HotBoardItemView()
    }
}
