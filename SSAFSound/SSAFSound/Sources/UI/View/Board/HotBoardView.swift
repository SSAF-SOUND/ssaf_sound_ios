//
//  HotBoardView.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/16.
//

import SwiftUI

struct HotBoardView: View {
    
    let boardName: String
    
    @Environment(\.presentationMode) var presentationMode
    @State private var isSearchView:Bool = false
    @StateObject var hotPostViewModel = HotPostViewModel()
    
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            NavigationStack{
                
                BackButtonView(title: "\(boardName)", spacingWidth: UIScreen.screenWidth/3 - 10, backButtonAction: {
                    presentationMode.wrappedValue.dismiss()
                }, showTitle: true)
                
                VStack{
                    searchBoardTextFieldView()
                    ScrollView(showsIndicators: false){
                        ForEach(hotPostViewModel.hotPostModel?.data?.posts ?? [], id: \.boardId) { hotPost in
                            NavigationLink(destination:PostView( preBoardName: hotPost.boardTitle, postId : hotPost.postId).navigationBarHidden(true)){
                                HotBoardItemView(hotPost: hotPost)
                            }
                        }

                    }.padding(.horizontal,25)
                }
            }
        }.task{
            hotPostViewModel.requestHotPostList()
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
}

struct HotBoardView_Previews: PreviewProvider {
    static var previews: some View {
        HotBoardView(boardName: "HOT")
    }
}
