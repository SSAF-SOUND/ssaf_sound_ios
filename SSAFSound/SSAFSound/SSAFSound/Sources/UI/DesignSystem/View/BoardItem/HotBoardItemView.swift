//
//  SelectedItemView.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/16.
//

import SwiftUI

struct HotBoardItemView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                VStack(alignment: .leading){
                    Text("00게시판")
                        .manropeFont(family: .Bold, size: 12)
                        .foregroundColor(.purplePoint)
                    Text("제목 위치제목 위치제목 위치제목 위치제목 위치제목 위치제목 위치제목 위치제목 위치제목 위치")
                        .manropeFont(family: .Bold, size: 14)
                        .lineLimit(1)
                        .foregroundColor(.white)
                }
                Spacer()
                ButtonGroup()
            }.padding(.bottom,12)
            Text("게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용")
                .manropeFont(family: .Regular, size: 14)
                .foregroundColor(.white)
                .lineLimit(1)
            
            Text("n분전 | 게시자")
                .manropeFont(family: .Bold, size: 12)
                .foregroundColor(.bluegrey)
        }.padding(EdgeInsets(top: 13, leading: 22, bottom: 13, trailing: 22))
            .frame(width: 340, height: 123)
            .background(Color.ssafSoundColor(.black))
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(Color(red: 0.53, green: 0.56, blue: 0.66), lineWidth: 1)
            )
    }
}

struct HotBoardItemView_Previews: PreviewProvider {
    static var previews: some View {
        HotBoardItemView()
    }
}