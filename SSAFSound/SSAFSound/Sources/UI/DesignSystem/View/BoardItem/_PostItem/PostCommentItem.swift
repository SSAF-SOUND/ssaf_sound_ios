//
//  PostCommentItem.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/19.
//

import SwiftUI

struct PostCommentItem: View {
    @State private var isEdit: Bool = true
    var body: some View {
        VStack(alignment: .leading,spacing:0){
            HStack(alignment: .center){
                // MARK: 닉네임 앞자 아이콘 넣을자리
                Spacer().frame(width: 16,height: 16)
                Text("NickName000")
                    .manropeFont(family: .Bold, size: 14)
                    .foregroundColor(.white)
                Image("track_fallback_primary")
                    .resizable()
                    .frame(width: 10,height: 15)
                    .padding(.trailing,10)
                Spacer()
                HStack(alignment : .center ,spacing: 12){
                    Button {
                        print("message")
                    } label: {
                        Image("messageOutline")
                            .resizable()
                            .frame(width: 16,height: 16)
                            .aspectRatio(contentMode: .fit)
                            
                    }.padding(.top,3)
                    
                    Button {
                        print("recommand")
                    } label: {
                        Image("great")
                            .resizable()
                            .frame(width: 16,height: 16)
                            .aspectRatio(contentMode: .fit)
                            
                    }
                    Button {
                        print("more")
                    } label: {
                        Image("dotsVertical")
                            .resizable()
                            .frame(width: 16,height: 16)
                            .aspectRatio(contentMode: .fit)
                            
                    }
                }
            }
            Text("댓글내용내용내용댓글내용내용내용댓글내용내용내용")
                .manropeFont(family: .Regular, size: 14)
                .foregroundColor(.white)
                .padding(.bottom,4)
            
            HStack{
                // MARK: 작성일(편집일) | 시간
                Text("00-00 | 00:00")
                    .manropeFont(family: .Regular, size: 12)
                    .foregroundColor(.white)
                if isEdit {
                    Text("(수정됨)")
                        .manropeFont(family: .Bold, size: 12)
                        .foregroundColor(.primaryPoint)
                }
            }
        }
    }
}


struct RePostCommentItem: View {
    @State private var isEdit: Bool = false
    var body: some View {
        HStack(alignment: .top,spacing: 6){
            Image("Reply")
                .resizable()
                .frame(width: 17,height: 17)
                .aspectRatio(contentMode: .fit)
                .colorMultiply(.primaryDefault)
//
            ZStack{
                Color.grey
                VStack(alignment: .leading,spacing:0){
                    HStack(alignment: .center){
                        // MARK: 닉네임 앞자 아이콘 넣을자리
                        Spacer().frame(width: 16,height: 16)
                        Text("NickName000")
                            .manropeFont(family: .Bold, size: 14)
                            .foregroundColor(.white)
                        Image("track_fallback_primary")
                            .resizable()
                            .frame(width: 10,height: 15)
                            .padding(.trailing,10)
                        Spacer()
                        HStack(alignment : .center ,spacing: 12){
                            Button {
                                print("recommand")
                            } label: {
                                Image("great")
                                    .resizable()
                                    .frame(width: 16,height: 16)
                                    .aspectRatio(contentMode: .fit)
                                    
                            }
                            Button {
                                print("more")
                            } label: {
                                Image("dotsVertical")
                                    .resizable()
                                    .frame(width: 16,height: 16)
                                    .aspectRatio(contentMode: .fit)
                                    
                            }
                        }
                    }
                    Text("댓글내용내용내용댓글내용내용내용댓글내용내용내용")
                        .manropeFont(family: .Regular, size: 14)
                        .foregroundColor(.white)
                        .padding(.leading,10)
                        .padding(.bottom,4)
                    
                    HStack{
                        // MARK: 작성일(편집일) | 시간
                        Text("00-00 | 00:00")
                            .manropeFont(family: .Regular, size: 12)
                            .foregroundColor(.white)
                        if isEdit {
                            Text("(수정됨)")
                                .manropeFont(family: .Bold, size: 12)
                                .foregroundColor(.primaryPoint)
                        }
                    }.padding(.leading,10)
                }
                
                .padding(8)
                
            }.cornerRadius(10)
        }
    }
}



struct PostCommentItem_Previews: PreviewProvider {
    static var previews: some View {
        RePostCommentItem()
    }
}
