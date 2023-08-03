//
//  NicknameAlertView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/07/25.
//

import SwiftUI

struct NicknameAlertView: View {
    var body: some View {
        ZStack {
            
            Color.ssafySoundblack.opacity(0.6)
                .edgesIgnoringSafeArea(.all)
            ZStack {
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 255, height: 143)
                  .background(.white)
                  .cornerRadius(10)
                  .shadow(color: Color.ssafySoundblack.opacity(0.25), radius: 3.5, x: 0, y: 1)
                  .overlay(
                    RoundedRectangle(cornerRadius: 10)
                      .inset(by: 0.25)
                      .stroke(Color(red: 1, green: 0.91, blue: 0.94), lineWidth: 0.5)
              )
                
                VStack {
                    Text("알림")
                      .font(
                        Font.custom("Pretendard", size: 16)
                          .weight(.bold)
                      )
                  .foregroundColor(Color(red: 0.53, green: 0.56, blue: 0.66))
                    
                    Spacer()
                        .frame(height: 4)
                    
                    // SSAFSOUND 한글 R/12
                    Text("닉네임을 James로 설정하시겠습니까?")
                      .font(Font.custom("Pretendard", size: 12))
                      .foregroundColor(Color(red: 0.36, green: 0.36, blue: 0.36))
                    
                    Spacer()
                        .frame(height: 31)
                    
                    Text("확인")
                      .font(
                        Font.custom("Pretendard", size: 16)
                          .weight(.bold)
                      )
                      .foregroundColor(Color(red: 0.6, green: 0.81, blue: 1))
                }
            } //: ZSTACK
        } //: ZSTACK
    }
}

struct NicknameAlertView_Previews: PreviewProvider {
    static var previews: some View {
        NicknameAlertView()
    }
}
