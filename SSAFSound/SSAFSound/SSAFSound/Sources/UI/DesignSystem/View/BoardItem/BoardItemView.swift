//
//  BoardItem.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/15.
//

import SwiftUI

struct BoardItemView: View {
    
    let BoardName: String
    
    var body: some View {
        HStack{
            Text("\(BoardName)\n게시판")
                .multilineTextAlignment(.leading)

                .font(
                    .manropeFont(family: .SemiBold, size: 15)
                    .weight(.semibold)
                )
                .padding(.leading,25)
                .foregroundColor(.ssafSoundColor(.black))
                .frame(height: 44.10422)
                
                
            Spacer()
        }.frame(width: 340, height: 105)
            .padding(.bottom, 13)
            .background(.white)
            .cornerRadius(20)
            
    }
}

struct BoardItemView_Previews: PreviewProvider {
    static var previews: some View {
        BoardItemView(BoardName: "자유게시판")
    }
}
