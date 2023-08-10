//
//  SelectedBoardView.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/16.
//

import SwiftUI

struct SelectedBoardView: View {
    
    let boardName: String
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isSearchView:Bool = false
    @State private var isWriteView:Bool = false
    
    var body: some View {
        ZStack{
            Color.background
                .edgesIgnoringSafeArea(.all)
            NavigationStack{
                // MARK: NAV BAR
                BackButtonView(title: "\(boardName)", spacingWidth: UIScreen.screenWidth/3 - 10, backButtonAction: {
                    presentationMode.wrappedValue.dismiss()
                }, showTitle: true)
                // MARK: CONTENT
                ZStack(alignment: .bottomTrailing) {
                    VStack{
                        // MARK: SEARCH BAR
                        searchBoardTextFieldView()
                        // MARK: SCROLLVIEW
                        ScrollView(showsIndicators: false){
                            ForEach(0..<10) { i in
                                NavigationLink(destination: PostView(preBoardName: boardName)
                                    .navigationBarHidden(true)){
                                    SelectedBoardItem()
                                }
                            }
                        }
                        .padding(.horizontal,25)
                    }
                    // MARK: GO WRITE
                    goWriteFloatingButtonView()
                }
            }
        }
    }
    @ViewBuilder
    private func searchBoardTextFieldView() -> some View {
        Button {
            isSearchView.toggle()
        } label: {
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
        }.navigationDestination(isPresented: $isSearchView) {
            SearchView(pre2BoardName: boardName)
                .navigationBarHidden(true)
        }

        
    }
    
    @ViewBuilder
    private func goWriteFloatingButtonView() -> some View {
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
            PostWriteView()
                .navigationBarHidden(true)
        }

        
    }
    
    
}


struct SelectedBoardView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedBoardView(boardName: " 게시판")
    }
}
