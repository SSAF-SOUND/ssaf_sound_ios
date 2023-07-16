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
            VStack{
                ScrollView{
                    SelectedBoardItem()
                    SelectedBoardItem()
                    SelectedBoardItem()
                }
            }
        }
        
    }
}


struct SelectedBoardView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedBoardView(boardName: " 게시판")
    }
}
