//
//  SelectedBoardItem.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/16.
//

import SwiftUI

struct SelectedBoardItem: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("제목 위치제목 위치제목 위치제목 위치제목 위치제목 위치제목 위치제목 위치제목 위치제목 위치")
                .manropeFont(family: .Bold, size: 18)
                .lineLimit(1)
                .foregroundColor(.white)
            Text("게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용")
                .manropeFont(family: .Regular, size: 14)
                .foregroundColor(.white)
                .lineLimit(1)
            Spacer()
            HStack{
                VStack(alignment: .leading){
                    Text("n분전 | 게시자")
                        .manropeFont(family: .Bold, size: 12)
                        .foregroundColor(.bluegrey)
                }
                Spacer()
                InfoGroup()
            }
        }.padding(EdgeInsets(top: 14, leading: 22, bottom: 14, trailing: 22))
            .frame(height: 123)
            .background(Color.ssafSoundColor(.black))
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(Color(red: 0.53, green: 0.56, blue: 0.66), lineWidth: 1)
            )
        
    }
}

struct SelectedBoardItem_Previews: PreviewProvider {
    static var previews: some View {
        SelectedBoardItem()
    }
}
