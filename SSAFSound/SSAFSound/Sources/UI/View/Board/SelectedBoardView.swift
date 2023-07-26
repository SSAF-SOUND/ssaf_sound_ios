//
//  SelectedBoardView.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/16.
//

import SwiftUI

struct SelectedBoardView: View {
    
    let boardName: String
    
    var body: some View {
        ZStack{
            Color.background
                .edgesIgnoringSafeArea(.all)
            NavigationStack{
                ZStack(alignment: .bottomTrailing) {
                    VStack{
                        NavigationLink(destination: SearchView()){
                            searchBoardTextFieldView()
                        }
                        ScrollView{
                            ForEach(0..<10) { i in
                                NavigationLink(destination: PostView() ){
                                    SelectedBoardItem().toolbarRole(.editor)
                                }
                            }
                        }
                        .padding(.horizontal,25)
                    }
                    NavigationLink(destination: PostWriteView()
                        .toolbarRole(.editor)
                        .navigationTitle("게시글 쓰기")
                        .toolbar {
                            Button {
                                print("sumbit")
                            } label: {
                                Text("완료")
                                    .manropeFont(family: .Regular, size: 16)
                                    .foregroundColor(.grey)
                            }
                        }
                    ){
                        goWriteFloatingButtonView()
                    }
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
    
    @ViewBuilder
    private func goWriteFloatingButtonView() -> some View {
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
    
    
}


struct SelectedBoardView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedBoardView(boardName: " 게시판")
    }
}
