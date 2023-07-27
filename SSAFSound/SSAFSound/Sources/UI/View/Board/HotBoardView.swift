//
//  HotBoardView.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/16.
//

import SwiftUI

struct HotBoardView: View {
    
    let boardName: String
    
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            NavigationStack{
                VStack{
                    NavigationLink(destination: SearchView()){
                        searchBoardTextFieldView()
                    }
                    ScrollView(showsIndicators: false){
                        ForEach(0..<10) { i in
                            NavigationLink(destination:PostView()){HotBoardItemView().toolbarRole(.editor)}
                        }
                    }.padding(.horizontal,25)
                }
            }
        }
    }
    
    @ViewBuilder
    private func searchBoardTextFieldView() -> some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(height: 42)
                .overlay {
                    HStack {
                        Text("검색어를 입력해주세요")
                            .manropeFont(family: .Regular, size: 14)
                            .foregroundColor(.grey)
                            .kerning(-0.3)
                        Spacer()
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 15)
                            .foregroundColor(.ssafySoundblack)
                    }
                    .padding(.horizontal, 20)
                }
                
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
    }
}

struct HotBoardView_Previews: PreviewProvider {
    static var previews: some View {
        HotBoardView(boardName: "HOT 게시판")
    }
}
