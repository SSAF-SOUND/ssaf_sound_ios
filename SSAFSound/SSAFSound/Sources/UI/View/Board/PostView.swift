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
            VStack {
                BackButtonView(title: "\(preBoardName)", spacingWidth: UIScreen.screenWidth / 3 - 10, backButtonAction: {
                    presentationMode.wrappedValue.dismiss()
                }, showTitle: true)

                VStack {
                    ScrollView(showsIndicators: false) {
                        if let post = postViewModel.postModel?.data?.post {
                            postContentItemView(post: post)
                        }
                        Spacer().frame(height: 40)
                        PostCommentItemGroup(getPostId: postId).padding(.horizontal, 8)
                    }
                    Spacer()
                    PostTextInputItem().padding(.horizontal, 25)
                    Spacer()

                }
            }.task {
                postViewModel.requestPostDetail(postId: postId)
            }


        }
    }


    @ViewBuilder
    private func postContentItemView(post: PostDetail) -> some View {
        ZStack {
            Color.backgroundGray
            VStack(alignment: .leading, spacing: 11) {
                HStack(alignment: .center) {
                    // MARK: 닉네임 앞자 아이콘 넣을자리
                    Spacer().frame(width: 20, height: 20)
                    Text((post.author?.nickname)!)
                        .manropeFont(family: .Bold, size: 18)
                        .foregroundColor(.basicWhite)
                    Image("track_fallback_primary")
                        .resizable()
                        .frame(width: 10, height: 15)
                        .padding(.trailing, 10)
                    Spacer()
                    Button {
                        print("more")
                    } label: {
                        Image(asset: .dots)
                            .resizable()
                            .frame(width: 16, height: 16)
                            .aspectRatio(contentMode: .fit)
                    }
                }
                // MARK: 작성일(편집일) | 시간
                Text(post.createdAt)
                    .manropeFont(family: .Regular, size: 12)
                    .foregroundColor(.basicWhite)
                HStack {
                    Text(post.title)
                        .manropeFont(family: .Bold, size: 16)
                        .foregroundColor(.basicWhite)
                    if post.modified {
                        Text("(수정됨)")
                            .manropeFont(family: .Bold, size: 12)
                            .foregroundColor(.primaryPoint)
                    }
                }
                Text(post.content)
                    .manropeFont(family: .Bold, size: 13)
                    .foregroundColor(.basicWhite)
                    .padding(.bottom, 30)
                postInteractionStatsView(likeCount: post.likeCount, commentCount: post.commentCount, scrapCount: post.scrapCount)

            }.padding()
        }.frame(minHeight: 169)
    }

    @ViewBuilder
    private func postInteractionStatsView(likeCount: Int, commentCount: Int, scrapCount: Int) -> some View {
        HStack(alignment: .center, spacing: 7) {
            HStack(alignment: .center, spacing: 7) {
                Image(asset: .thumb)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .aspectRatio(contentMode: .fit)
                    .colorMultiply(.primaryDefault)
                Text("\(likeCount)")
                    .manropeFont(family: .Bold, size: 13)
                    .foregroundColor(.primaryDefault)
            }
            HStack(alignment: .center, spacing: 7) {
                Image(asset: .bookMark)
                    .resizable()
                    .frame(width: 16, height: 20)
                    .aspectRatio(contentMode: .fit)
                    .colorMultiply(.primaryDefault)
                Text("\(scrapCount)")
                    .manropeFont(family: .Bold, size: 13)
                    .foregroundColor(.primaryDefault)
            }
            Spacer()
            HStack(alignment: .center, spacing: 7) {
                Image(asset: .message)
                    .resizable()
                    .frame(width: 20, height: 20)
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
        PostView(preBoardName: "", postId: 2)
    }
}
