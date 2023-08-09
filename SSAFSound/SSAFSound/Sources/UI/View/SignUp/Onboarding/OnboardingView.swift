//
//  OnboardingView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/08/05.
//

import SwiftUI

struct OnboardingView: View {
    var isSsafy: Bool
    var nickname: String
    
    var body: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
            
            VStack() {
                Spacer()
                    .frame(height: 126)
                
                Text("반갑습니다!\n\(nickname)님")
                    .font(Font.manropeFont(family: .ExtraBold, size: 28))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 344, height: 84, alignment: .top)
                
                Image(asset: ImageAsset.track_fallback_primary)
                    .frame(width: 161, height: 162)
                
                

                Spacer()
                    .frame(width: 294)
                
                Text("SSAFY 인증 시 프로필에\nSSAFY 트랙 뱃지가 표시됩니다")
                    .font(Font.manropeFont(family: .ExtraBold, size: 18))
                  .multilineTextAlignment(.center)
                  .foregroundColor(.white)
                  .frame(width: 286, alignment: .top)
                
                Spacer()
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(isSsafy: true, nickname: "James")
    }
}
