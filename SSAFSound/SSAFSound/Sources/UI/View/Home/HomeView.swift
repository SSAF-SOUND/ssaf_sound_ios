//
//  HomeView.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/07/20.
//

import SwiftUI

// MARK: - HOME VIEW
struct HomeView: View {
    @StateObject var hotPostViewModel = HotPostViewModel()
    @State private var isHotBoard: Bool = false
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea(.all)
            NavigationStack{
                VStack  {
                   MainHeaerView(systemImage: "bell.fill", systemImage2: "ellipsis.message.fill")
                    ScrollView(showsIndicators: false) {
                        VStack {
                            
                            Spacer()
                                .frame(height: 38)
                            serverTimeView()
                            Spacer()
                                .frame(height: 31)
                            lunchMenuView()
                            
                            Spacer()
                                .frame(height: 31)
                            
                            
                            HStack() {
                                Text("Hot 게시글")
                                    .font(.pretendardBold24)
                                    .padding(.leading, 25)
                                Spacer()
                                navHotBoard()
                            }
                            .foregroundColor(.whilte)
                            
    //                        ForEach(1...5, id: \.self) { _ in
    //                            HomeHotItemView(board: hotPostViewModel.hotPostModel?.data.posts.first?.boardTitle ?? "취업", title: "점메추해주라!!", likeCount: 1, commentCount: 1)
    //                        }
                            
                            // TODO: 데이터 없을때 default 사이즈 정의 해야할듯
                            ForEach(hotPostViewModel.hotPostModel?.data?.posts ?? [], id:\.boardId) {
                                hotPost in
                                NavigationLink(destination:PostView( preBoardName: hotPost.boardTitle, postId : hotPost.postId).navigationBarHidden(true)){
                                    HomeHotItemView(hotPost: hotPost)
                                }
                            }
                            
                            HStack() {
                                Text("리쿠르팅 게시글")
                                    .font(.pretendardBold24)
                                    .padding(.leading, 25)
                                Spacer()
                                Text("더보기")
                                    .padding(.trailing, 25)
                                    .font(.pretendardBold16)
                            }
                            .foregroundColor(.whilte)
                            
                            
                        } //: VSTACK
                        
                        // MARK: - 가로 스크롤 안 됨!
                        recruitPostPreview()
                            .padding(.horizontal, 20)
                            
                        Spacer()
                            .frame(height: UIScreen.screenWidth*0.1)
                        
                        
                        
                    } //: SCROLLVIEW
                    .bounce(false)
                    
                }
            }
            
            .task {
                hotPostViewModel.requestHotPostList()
            }
            
        } //: ZSTACK
    }
    @ViewBuilder
    private func navHotBoard() -> some View {
        Button {
            isHotBoard.toggle()
        } label: {
            Text("더보기")
                .padding(.trailing, 25)
                .font(.pretendardBold16)
                .foregroundColor(.basicWhite)
        }
            .navigationDestination(isPresented: $isHotBoard) {
            HotBoardView(boardName: "HOT 게시판")
                .navigationBarHidden(true)
        }

    }
}

// MARK: - Main 상단바
@ViewBuilder
private func recuritTopHeaderView() -> some View {
    Spacer()
        .frame(height: 14)
    
    HStack {
        Image(asset: .logo)
            .resizable()
            .scaledToFit()
            .frame(width: UIScreen.screenWidth/4 , height: 22)
        
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

// MARK: - Main SSAFY 서버시간
@ViewBuilder private func serverTimeView() -> some View {
    
    ZStack {
        HStack {
            Text("09 : 36 : 45")
                .foregroundColor(Color.ssafSoundColor(.whilte))
                .font(.pretendardBold28)
            
            VStack(alignment: .trailing) {
                Text("SSAFY 서버시간")
                    .foregroundColor(Color.ssafSoundColor(.primaryDefault))
                Text("5월 9일 수요일")
                    .foregroundColor(Color.ssafSoundColor(.whilte))
            }
            .font(.pretendardBold14)
        }
        Capsule()
            .stroke(Color.ssafSoundColor(.primaryDefault))
            .frame(width: 339, height: 67)
    }
}

// MARK: - Main 점심 메뉴 투표
@ViewBuilder private func lunchMenuView() -> some View {
    RoundedRectangle(cornerRadius: 20)
        .fill(.white)
        .frame(width: 340, height: 206)
}


// MARK: - Main Hot 게시글
//@ViewBuilder private func hotPostPreview(board: String, title: String, likeCount: Int, commentCount: Int) -> some View {
//
//    var board: String = board
//    var title: String = title
//    var likeCount: Int = likeCount
//    var commentCount: Int = commentCount
//
//    HStack(alignment: .top) {
//        Spacer()
//            .frame(width: 24)
//        Rectangle()
//            .frame(width: 47, height: 22)
//            .cornerRadius(20)
//            .foregroundColor(.whilte)
//            .overlay {
//                Text(board)
//                    .font(.pretendardBold12)
//            }
//
//
//        Text(title)
//            .foregroundColor(.whilte)
//            .font(.pretendardRegualar14)
//
//        Spacer()
//
//        Image(asset: .thumb_fill)
//        Text("\(likeCount)")
//            .foregroundColor(.whilte)
//            .font(.pretendardRegualar14)
//        Spacer()
//            .frame(width: 8)
//
//        Image(asset: .chat_fill)
//
//        Text("\(commentCount)")
//            .foregroundColor(.whilte)
//            .font(.pretendardRegualar14)
//
//        Spacer()
//            .frame(width: 21)
//    }
//    .frame(width: .infinity)
//}


// MARK: - Main 리쿠르팅 게시글
@ViewBuilder private func recruitPostPreview() -> some View {
    ScrollView(.horizontal, showsIndicators: false) {
        HStack {
            ForEach(1...5, id: \.self) { _ in
                HomeRecruitItemView(category: "프로젝트")
            }
        }
    }
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
