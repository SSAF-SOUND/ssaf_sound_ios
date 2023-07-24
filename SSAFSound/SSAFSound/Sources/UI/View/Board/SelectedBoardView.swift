//
//  SelectedBoardView.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/16.
//

import SwiftUI

struct SelectedBoardView: View {
    let boardName: String
    @State var serachRecuritText: String = ""
    
    var body: some View {
        
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            NavigationStack{
                VStack{
                    searchRecuirTextFieldView()
                    ScrollView{
                        ForEach(0..<10) { i in
                            NavigationLink(destination: PostView() ){
                                SelectedBoardItem().toolbarRole(.editor)
                            }
                        }
                    }
                    .padding(.horizontal,25)
                }
            }
            
            FloatingButton()
        }
        
        
    }
    @ViewBuilder
    private func searchRecuirTextFieldView() -> some View {
        Spacer()
            .frame(height: 8)
        
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(height: 42)
                .overlay {
                    HStack {
                        TextField("검색어를 입력해주세요", text: $serachRecuritText)
                            .manropeFont(family: .Medium, size: 18)
                            .kerning(-0.3)
                        
                        Spacer()
                        
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 15)
                        
                        
                    }
                    .padding(.horizontal, 20)
                }
                
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
    }
}


struct SelectedBoardView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedBoardView(boardName: " 게시판")
    }
}
