//
//  BoardView.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/15.
//

import SwiftUI

struct BoardView: View {
    let boardItems: [String] = ["자유", "취업", "테크", "맛집", "질문", "싸피 예비생"]
    @State private var isHotBoard: Bool = false
    var body: some View {
        
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.top)
                NavigationStack{
                recuritTopHeaderView()
                VStack {
                    HStack {
                        Text("모아보기")
                            .manropeFont(family: .Bold, size: 15)
                            .foregroundColor(.white)
                        Spacer()
                        navHotBoard()
                    }
                    .padding(EdgeInsets(top: 15, leading: 25, bottom: 25, trailing: 25))
                    
                    ScrollView(showsIndicators: false) {
                        ForEach(boardItems, id: \.self) { types in
                            NavigationLink(
                                destination: SelectedBoardView(boardName: types)
                                    .navigationBarHidden(true)
                            ) {
                                BoardItemView(boardName: types)
                            }
                        }.padding(.horizontal,25)
                        Spacer()
                    }
                    
                }
            }
        }
    }
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
    
    @ViewBuilder
    private func navHotBoard() -> some View {
        Button {
            isHotBoard.toggle()
        } label: {
            Text("HOT")
                .manropeFont(family: .Bold, size: 15)
                .foregroundColor(.secondaryPoint)
        }
        .navigationDestination(isPresented: $isHotBoard) {
            HotBoardView(boardName: "HOT")
                .navigationBarHidden(true)
        }

    }
}


struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
