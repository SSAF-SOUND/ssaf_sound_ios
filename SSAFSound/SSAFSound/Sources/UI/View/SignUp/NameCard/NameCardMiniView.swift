//
//  NameCardMiniView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/10/18.
//

import SwiftUI

struct NameCardMiniView: View {

    var nickname: String
    var isMajor: Bool
    var trackImage: ImageAsset
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.clear)
            
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 2) {
                    Circle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.ssafSoundColor(isMajor ? .major : .nonMajor))
                    
                    // 줄바꿈 안 되는 현상 고칠 것
                    Text(nickname)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.basicWhite)
                        .font(.manropeBold18)
                        
                    Image(asset: trackImage)
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                .fontWeight(.medium)
            }

        } //: ZSTACK
        .fixedSize()
    }
}

struct NameCardMiniView_Previews: PreviewProvider {
    static var previews: some View {
        NameCardMiniView(nickname: "James", isMajor: true, trackImage: .track_fallback_primary)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
