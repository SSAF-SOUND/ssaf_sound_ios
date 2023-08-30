//
//  ProfileMenuButtonView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/08/23.
//

import SwiftUI

// MARK: - 프로필뷰의 메뉴 버튼 

struct ProfileMenuButtonView: View {
    var body: some View {
        VStack(spacing: 8) {
            menuButtonView(icon: .bookMark, name: "나의 스크랩")
            menuButtonView(icon: .bookMark, name: "내가 작성한 게시글")
        }
        
    }
}

@ViewBuilder private func menuButtonView(icon: ImageAsset, name: String) -> some View {
    
    Rectangle()
        .foregroundColor(.backgroundGray)
        .frame(height: 43)
        .overlay {
            HStack(spacing: 0) {
                Image(asset: icon)
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 18, height: 22)
                    .foregroundColor(.primaryDefault)
                Text(name)
                    .foregroundColor(.basicWhite)
                    .font(.pretendardBold16)
                    .padding(.leading, 15)
                Spacer()
                
            }
            .padding(.leading, 34)

        }
}

struct ProfileMenuButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileMenuButtonView()
    }
}
