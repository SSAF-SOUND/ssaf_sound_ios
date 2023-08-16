//
//  BoardView.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/15.
//

import SwiftUI

struct BoardView: View {
//    let boardItems: [String] = ["자유", "취업", "테크", "맛집", "질문", "싸피 예비생"]
    var boardItems: [String] = []
    @State private var isHotBoard: Bool = false
    @StateObject var boardviewModel: BoardViewModel2 = BoardViewModel2()
    var body: some View {

        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.top)
            NavigationStack {
                boardTopHeaderView()
                VStack {
                    HStack {
                        Spacer()
                        navHotBoard()
                    }
                        .padding(EdgeInsets(top: 15, leading: 25, bottom: 25, trailing: 25))

                    ScrollView(showsIndicators: false) {
                        ForEach(boardviewModel.boardModel?.data?.boards ?? [], id: \.boardId) { board in

                            NavigationLink(
                                destination: SelectedBoardView(boardName: board.title!, boardId : board.boardId!)
                                    .navigationBarHidden(true)
                            ) {
                                BoardItemView(title: board.title! , imageUrl : board.imageUrl ?? "track_fallback_primary" , description : board.description ?? "설명")
                            }
                        }
                            .padding(.horizontal, 25)
                        Spacer()
                    }
                }
            }
        }
            .task {
            boardviewModel.requestBoard()
        }
    }


    @ViewBuilder
    private func boardTopHeaderView() -> some View {
        Spacer()
            .frame(height: 14)

        HStack {
            Image(asset: .logo)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.screenWidth / 4, height: 22)

            Spacer()

            HStack {
                Image(systemName: "bell.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.whilte)

                Spacer()
                    .frame(width: 20)

                Image(systemName: "ellipsis.message.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.whilte)



            }

        }
            .padding(.horizontal, 25)
    }

    @ViewBuilder
    private func navHotBoard() -> some View {
        Button {
            isHotBoard.toggle()
        } label: {
            Text("Hot 게시글")
                .manropeFont(family: .Bold, size: 16)
                .foregroundColor(.secondaryPoint)
        }
            .navigationDestination(isPresented: $isHotBoard) {
            HotBoardView(boardName: "HOT 게시판")
                .navigationBarHidden(true)
        }

    }
}


struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
