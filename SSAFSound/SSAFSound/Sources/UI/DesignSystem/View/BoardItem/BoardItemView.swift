//
//  BoardItem.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/15.
//

import SwiftUI

struct BoardItemView: View {
    
    let boardName: String
    
    var body: some View {
        HStack{
            Text("\(boardName)\n게시판")
                .multilineTextAlignment(.leading)
                .font(
                    .manropeFont(family: .SemiBold, size: 20)
                )
                .padding(.leading,25)
                .foregroundColor(.ssafySoundblack)
            Spacer()
        }.frame(height: 105)
            .padding(.bottom, 13)
            .background(.white)
            .cornerRadius(20)
            
    }
}

struct BoardItemView_Previews: PreviewProvider {
    static var previews: some View {
        BoardItemView(boardName: "자유")
    }
}
