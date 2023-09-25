//
//  SelectedBoardView.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/16.
//

import SwiftUI

struct SelectedBoardView: View {

    let boardName: String
    let boardId: Int

    @Environment(\.presentationMode) var presentationMode

    @State private var isSearchView: Bool = false
    @State private var isWriteView: Bool = false
    // MARK: postViewModel 데이터 집합
    @StateObject var postViewModel: PostViewModel = PostViewModel()


    var body: some View {
        ZStack (alignment: .bottomTrailing) {
            Color.background
                .edgesIgnoringSafeArea(.all)
            VStack {
                // MARK: NAV BAR
                BackButtonView(title: "\(boardName)", spacingWidth: UIScreen.screenWidth / 3 - 10, backButtonAction: {
                    presentationMode.wrappedValue.dismiss()
                }, showTitle: true)
                    .task {
                    postViewModel.requestPostList(boardId: boardId)
                }
                // MARK: SEARCH BAR
                searchBoardTextFieldView()
                // MARK: SCROLLVIEW
                ScrollView(showsIndicators: false) {
                    ForEach(postViewModel.postModel?.data?.posts ?? [], id: \.postId) {
                        posts in
                        if posts.boardId == boardId {
                            NavigationLink(
                                destination: PostView(preBoardName: posts.boardTitle!, postId: posts.postId!)
                                    .navigationBarHidden(true)
                            ) {
                                selectedBoardItemView(
                                    title: posts.title!,
                                    content: posts.content!,
                                    likeCount: posts.likeCount!,
                                    commentCount: posts.commentCount!,
                                    createdAt: posts.createdAt!,
                                    nickname: posts.nickname!,
                                    anonymity: posts.anonymity!,
                                    thumbnail: posts.thumbnail ?? ""
//                                            cursor : posts.cursor ?? -1
                                )
                            }

                        }
                    }

                }
                    .padding(.horizontal, 25)
            }
            // MARK: GO WRITE
            goWriteFloatingButtonView(boardId: boardId)
        }
    }
    @ViewBuilder
    private func searchBoardTextFieldView() -> some View {
        Button {
            isSearchView.toggle()
        } label: {
            VStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.basicWhite)
                    .frame(height: 42)
                    .overlay {
                    HStack {
                        Text("검색어를 입력해주세요")
                            .manropeFont(family: .Regular, size: 14)
                            .foregroundColor(Color(red: 0.76, green: 0.76, blue: 0.77))
                            .kerning(-0.3)
                        Spacer()

                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 15)
                            .foregroundColor(.basicBlack)
                    }
                        .padding(.horizontal, 20)
                }

            }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
        }.navigationDestination(isPresented: $isSearchView) {
            SearchView(pre2BoardName: boardName)
                .navigationBarHidden(true)
        }


    }

    @ViewBuilder
    private func goWriteFloatingButtonView(boardId: Int) -> some View {
        Button {
            isWriteView.toggle()
        } label: {
            Circle()
                .fill(Color.primaryDefault)
                .frame(width: 43, height: 43)
                .overlay {
                Image(asset: .pencil)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 38, trailing: 25))
                .zIndex(2)
        }
            .navigationDestination(isPresented: $isWriteView) {
            PostWriteView(boardId: boardId)
                .navigationBarHidden(true)
        }
    }

    @ViewBuilder
    private func selectedBoardItemView(title: String, content: String, likeCount: Int, commentCount: Int, createdAt: String, nickname: String, anonymity: Bool, thumbnail: String) -> some View {

        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .manropeFont(family: .Bold, size: 18)
                .lineLimit(1)
                .foregroundColor(.white)
            Text(content)
                .manropeFont(family: .Regular, size: 14)
                .foregroundColor(.white)
                .lineLimit(1)
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    if anonymity {
                        Text("\(createdAt) | 익명")
                            .manropeFont(family: .Bold, size: 12)
                            .foregroundColor(.fontBlueBlack)
                    } else {
                        Text("\(createdAt) | \(nickname)")
                            .manropeFont(family: .Bold, size: 12)
                            .foregroundColor(.fontBlueBlack)
                    }

                }
                Spacer()
                boardInteractionStatsView(likeCount: likeCount, commentCount: commentCount)
            }
        }.padding(EdgeInsets(top: 14, leading: 22, bottom: 14, trailing: 22))
            .frame(height: 123)
            .background(Color.fontBlack)
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8)
            .stroke(Color.fontBlueBlack, lineWidth: 1)
        )
    }

    @ViewBuilder
    private func boardInteractionStatsView(likeCount: Int, commentCount: Int
    ) -> some View {
        HStack(alignment: .center, spacing: 4) {
            HStack(alignment: .center, spacing: 4) {
                Image(asset: .thumb)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .aspectRatio(contentMode: .fit)
                    .colorMultiply(.primaryDefault)
                    .padding(.bottom, 3)
                Text("\(likeCount)")
                    .manropeFont(family: .Bold, size: 13)
                    .foregroundColor(.primaryDefault)
            }
            HStack(alignment: .center, spacing: 4) {
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


struct SelectedBoardView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedBoardView(boardName: " 게시판", boardId: 1)
    }
}
