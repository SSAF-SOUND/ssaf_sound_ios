//
//  BoardView.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/15.
//

import SwiftUI

struct BoardView: View {
    let boardItems: [String] = ["자유", "취업", "테크", "맛집", "질문", "싸피 예비생"]
    
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.top)
            
            VStack {
                HStack {
                    Text("모아보기")
                        .manropeFont(family: .Bold, size: 15)
                        .foregroundColor(.white)
                    Spacer()
                    
                    NavigationStack{
                        NavigationLink (destination: DetailView(boardName: "Hot 게시판")
                            .navigationTitle("HOT 게시판")
                            .toolbarRole(.editor)
                        ){
                            Text("Hot")
                                .manropeFont(family: .Bold, size: 15)
                                .foregroundColor(.secondaryPoint)
                        }
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 25, bottom: 26, trailing: 25))
                
                NavigationStack{
                    ScrollView {
                        ForEach(boardItems, id: \.self) { boardName in
                            NavigationLink(destination: DetailView(boardName: boardName)
                                .navigationTitle(boardName+"게시판")
                                .toolbarRole(.editor)
                            ) {
                                BoardItemView(BoardName: boardName)
                            }
                        }
                    }
                }
                
            }
        }
    }
}

// MARK: Navigation test용
struct DetailView: View {
    let boardName: String
    
    var body: some View {
        Text("Detail View for \(boardName)")
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
