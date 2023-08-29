//
//  PostCommentItem.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/19.
//

import SwiftUI

struct PostCommentItem: View {
    // MARK: API 연결 이후 작업 예정 : 댓글 수정 여부에 따른 상태 표시
    @State private var isEdit: Bool = true
    @State private var repliesNum: Int = 1
    @State var isMore: Bool = false
    @State var isReMore: Bool = false
    @State var isAlert: Bool = false
    @State var isReAlert: Bool = false
    @State var declarationComment: String = ""
    @State var declarationReComment: String = ""
    
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
                        Image(asset: .message)
                            .resizable()
                            .frame(width: 16,height: 16)
                            .aspectRatio(contentMode: .fit)
                        
                    }.padding(.top,3)
                    
                    Button {
                        print("recommand")
                    } label: {
                        Image(asset: .thumb)
                            .resizable()
                            .frame(width: 16,height: 16)
                            .aspectRatio(contentMode: .fit)
                        
                    }
                    moreButton()
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
            }.padding(.bottom,5)
            
            if repliesNum > 0 {
                repliesCommentItemView()
            }
        }
    }
    
    @ViewBuilder
    private func repliesCommentItemView() -> some View {
        HStack(alignment: .top,spacing: 6){
            Image(asset: .reply)
                .resizable()
                .frame(width: 17,height: 17)
                .aspectRatio(contentMode: .fit)
                .colorMultiply(.primaryDefault)
            //
            ZStack{
                Color.backgroundGray
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
                                Image(asset: .thumb)
                                    .resizable()
                                    .frame(width: 16,height: 16)
                                    .aspectRatio(contentMode: .fit)
                                
                            }
                            reMoreButton()
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
    
    @ViewBuilder
    private func moreButton() -> some View {
        Button {
            isMore = true
        } label: {
            Image(asset: .dots)
                .resizable()
                .frame(width: 16,height: 16)
                .aspectRatio(contentMode: .fit)
            
        }.confirmationDialog("댓글 메뉴", isPresented: $isMore ) {
            Button {
                print("수정하기")
                isMore = false
            } label: {
                Text("수정하기")
            }
            Button {
                print("삭제하기")
                isMore = false
            } label: {
                Text("삭제하기")
            }
            
            Button {
                print("신고하기")
                isMore = false
                isAlert = true
            } label: {
                Text("신고하기")
            }
            Button(role : .cancel) {
                print("닫기")
                isMore = false
            } label: {
                Text("닫기")
            }
        } message:{
            Text("댓글 메뉴")
        }
        .alert(Text("해당 댓글을 정말 신고하겠습니까?"), isPresented: $isAlert) {
            Button("취소", role: .cancel){}
            Button("신고",role: .destructive){}
            TextField("신고사유", text : $declarationComment)
        } message: {
            Text("검수 후 자동으로 삭제됩니다")
        }
        
    }
    @ViewBuilder
    private func reMoreButton() -> some View {
        Button {
            isReMore = true
        } label: {
            Image(asset: .dots)
                .resizable()
                .frame(width: 16,height: 16)
                .aspectRatio(contentMode: .fit)
            
        }.confirmationDialog("", isPresented: $isReMore ) {
            // MARK: 구분 확인용
            Button(role : .destructive) {
                print("수정하기")
                isReMore = false
            } label: {
                Text("수정하기")
            }
            Button(role : .destructive) {
                print("삭제하기")
                isReMore = false
            } label: {
                Text("삭제하기")
            }
            Button(role : .destructive) {
                print("신고하기")
                isReMore = false
                isReAlert = true
            } label: {
                Text("신고하기")
            }
            Button(role : .cancel) {
                print("닫기")
                isReMore = false
            } label: {
                Text("닫기")
            }
        } message:{
          Text("댓글 메뉴")
        }
        .alert(Text("해당 대댓글을 정말 신고하겠습니까?"), isPresented: $isReAlert) {
            Button("취소", role: .cancel){}
            Button("신고",role: .destructive){}
            TextField("신고사유", text : $declarationReComment)
        } message: {
            Text("검수 후 자동으로 삭제됩니다")
        }
        
    }
}

struct PostCommentItem_Previews: PreviewProvider {
    static var previews: some View {
        PostCommentItem()
    }
}
