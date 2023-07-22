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
        
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            NavigationStack{
                VStack{
                ScrollView{
                    ForEach(0..<10) { i in
                        NavigationLink(destination: PostView() ){
                            SelectedBoardItem().toolbarRole(.editor)
                        }
                    }
                }
                .padding(.horizontal,25)
            }}
            FloatingButton()
        }
        
    }
}


struct SelectedBoardView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedBoardView(boardName: " 게시판")
    }
}
