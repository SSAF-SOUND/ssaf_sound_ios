//
//  BoardItem.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/15.
//

import SwiftUI

struct BoardItemView: View {

    let title: String
    let imageUrl: String
    let description: String

    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text("\(title)")
                    .multilineTextAlignment(.leading)
                    .font(
                        .manropeFont(family: .Bold, size: 24)
                )

                Text("\(description)")
                    .multilineTextAlignment(.leading)
                    .font(
                        .manropeFont(family: .Bold, size: 14)
                )
                    .foregroundColor(.bluegrey)
            }.padding(.leading, 28)
            Spacer()
            VStack{
                Spacer()
                Image("\(imageUrl)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 92, height: 92)
                    .padding(.top, 32)
                    .padding(.trailing,20)
            }
            

        }.frame(height: 105)
            .padding(.bottom, 13)
            .background(.white)
            .cornerRadius(20)

    }
}

struct BoardItemView_Previews: PreviewProvider {
    static var previews: some View {
        BoardItemView(title: "자유 게시판", imageUrl: "track_fallback_primary", description: "자유롭게 글을 작성해봐요!")
    }
}
