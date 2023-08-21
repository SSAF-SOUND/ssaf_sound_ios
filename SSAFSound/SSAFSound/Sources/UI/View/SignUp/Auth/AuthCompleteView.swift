//
//  AuthCompleteView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/08/09.
//

import SwiftUI

struct AuthCompleteView: View {
    var body: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                // SSAFSOUND 한글 B/28
                Text("SSAFY 캐릭터 프로필이\n생성되었습니다")
                    .font(Font.custom("Pretendard", size: 28))
                    .fontWeight(.bold)
                  .multilineTextAlignment(.center)
                  .foregroundColor(.white)
                  .frame(width: 344, height: 84, alignment: .top)
                
                Text("SAFFY만의 커뮤니티를 이용해보세요")
                  .font(Font.custom("Pretendard", size: 16))
                  .multilineTextAlignment(.center)
                  .foregroundColor(Color(red: 0.6, green: 0.81, blue: 1))
                  .frame(width: 332, alignment: .top)
                
                Spacer()
                
                Image(asset: .track_fallback_primary)
                NameCardView(background: true, nickname: "James", campus: "서울캠퍼스", semester: "10기", isMajor: false, trackImage: ImageAsset.track_fallback_primary)
                
                Spacer()
                
                Button {
                    //  메인으로 이동
                } label: {
                    Rectangle()
                        .fill(Color.ssafSoundColor(.primaryDefault))
                        .frame(width: 338, height: 56)
                        .cornerRadius(8)
                        .overlay(Text("확인"))
                        .foregroundColor(Color.ssafySoundblack)
                }
                
                Spacer()
            }
        }
    }
}

struct AuthCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        AuthCompleteView()
    }
}
