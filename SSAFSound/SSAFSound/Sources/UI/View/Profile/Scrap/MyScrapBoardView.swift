//
//  MyScrapBoardView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/10/08.
//

import SwiftUI

struct MyScrapBoardView: View {
    var board: String
    var title: String
    var subtitle: String
    
    var like: Int
    var comment: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.fontBlueBlack)
            VStack(alignment: .leading) {
                HStack {
                    Text(board)
                        .font(.manropeBold18)
                        .foregroundColor(.primaryDefault)
                    Spacer()
                    
                }
                
                Text(title)
                    .font(.pretendardBold14)
                    .foregroundColor(.basicWhite)
                
                Text(subtitle)
                    .font(.pretendardRegualar14)
                    .foregroundColor(.basicWhite)
            }
            
            .padding(.leading, 23)
        }
//        .frame(width: 340, height: 123)
        .frame(height: 123)
    }
}



struct MyScrapBoardView_Previews: PreviewProvider {
    static var previews: some View {
        MyScrapBoardView(board: "자유게시판", title: "아니 오늘 건물 1층에서", subtitle: "이재용 본 것 같은데", like: 12, comment: 7)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
