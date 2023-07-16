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
            VStack{
                ScrollView{
                    HotBoardItemView()
                    HotBoardItemView()
                    HotBoardItemView()
                }
            }
        }
    }
}

struct HotBoardView_Previews: PreviewProvider {
    static var previews: some View {
        HotBoardView(boardName: "HOT 게시판")
    }
}
