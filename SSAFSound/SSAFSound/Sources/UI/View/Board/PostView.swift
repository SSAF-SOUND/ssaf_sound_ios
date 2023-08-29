//
//  PostView.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/19.
//

import SwiftUI

struct PostView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let preBoardName: String
    let postId: Int
    
    // MARK: postViewModel 데이터 집합
    @StateObject var postViewModel: PostViewModel = PostViewModel()
    
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            NavigationStack{
                VStack{
                    BackButtonView(title: "\(preBoardName)", spacingWidth: UIScreen.screenWidth/3 - 10, backButtonAction: {
                        presentationMode.wrappedValue.dismiss()
                    }, showTitle: true)
                    
                    VStack{
                        ScrollView(showsIndicators: false){
                            if let post = postViewModel.postModel?.data?.post{
                                postContentItemView(
                                    title : post.title ?? "",
                                    nickname : post.nickname ?? "",
                                    createdAt : post.createdAt ?? "",
                                    modified: post.modified ?? false,
                                    content : post.content ?? "",
                                    likeCount : post.likeCount ?? 0,
                                    commentCount : post.commentCount ?? 0,
                                    scrapCount : post.scrapCount ?? 0
                                )
                            }
                            Spacer().frame(height: 70)
                            PostCommentItem()
                            PostCommentItem()
                        }
                        Spacer()
                        PostTextInputItem()
                        Spacer()
                        
                    }.padding(.horizontal,25)
                }
            }.task {
                postViewModel.requestPostDetail(postId: postId)
            }
            
        }
    }
    @ViewBuilder
    private func postContentItemView(title : String, nickname : String, createdAt : String, modified : Bool, content : String, likeCount : Int, commentCount : Int, scrapCount : Int) -> some View {
        ZStack{
            Color.backgroundGray
            VStack(alignment: .leading,spacing: 11){
                HStack(alignment: .center){
                    // MARK: 닉네임 앞자 아이콘 넣을자리
                    Spacer().frame(width: 20,height: 20)
                    Text(nickname)
                        .manropeFont(family: .Bold, size: 18)
                        .foregroundColor(.basicWhite)
                    Image("track_fallback_primary")
                        .resizable()
                        .frame(width: 10,height: 15)
                        .padding(.trailing,10)
                    // MARK: 작성일(편집일) | 시간
                    Text(createdAt)
                        .manropeFont(family: .Regular, size: 12)
                        .foregroundColor(.basicWhite)
                    Spacer()
                    if modified {
                        Text("(수정됨)")
                            .manropeFont(family: .Bold, size: 12)
                            .foregroundColor(.primaryPoint)
                    }
                    
                }
                
                Text(title)
                    .manropeFont(family: .Bold, size: 16)
                    .foregroundColor(.basicWhite)
                
                Text(content)
                    .manropeFont(family: .Bold, size: 13)
                    .foregroundColor(.basicWhite)
                    .padding(.bottom,30)
                //                PostInteractionStats()
                postInteractionStatsView(likeCount: likeCount, commentCount: commentCount, scrapCount: scrapCount)
                
            }.padding()
        }.frame(minHeight: 169)
    }
    
    @ViewBuilder
    private func postInteractionStatsView(likeCount : Int, commentCount : Int, scrapCount : Int) -> some View {
        HStack(alignment: .center, spacing: 7){
            HStack(alignment: .center, spacing: 7){
                Image(asset: .thumb)
                    .resizable()
                    .frame(width: 20,height: 20)
                    .aspectRatio(contentMode: .fit)
                    .colorMultiply(.primaryDefault)
                Text("\(likeCount)")
                    .manropeFont(family: .Bold, size: 13)
                    .foregroundColor(.primaryDefault)
            }
            HStack(alignment: .center,spacing: 7){
                Image(asset: .bookMark)
                    .resizable()
                    .frame(width: 16,height: 20)
                    .aspectRatio(contentMode: .fit)
                    .colorMultiply(.primaryDefault)
                Text("\(scrapCount)")
                    .manropeFont(family: .Bold, size: 13)
                    .foregroundColor(.primaryDefault)
            }
            Spacer()
            HStack(alignment: .center,spacing: 7){
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

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(preBoardName:"" , postId : 1)
    }
}
