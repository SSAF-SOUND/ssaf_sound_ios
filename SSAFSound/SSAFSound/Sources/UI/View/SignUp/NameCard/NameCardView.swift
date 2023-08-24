//
//  NameCardView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/08/09.
//

import SwiftUI

struct NameCardView: View {
    //MARK: - PROPERTIES
    
    var background: Bool
    var nickname: String
    var campus: String
    var semester: String
    var isMajor: Bool
    var trackImage: ImageAsset
    
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(background ? .whilte : .clear)
            
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 2) {
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.ssafSoundColor(isMajor ? .major : .nonMajor))
                    
                    // 줄바꿈 안 되는 현상 고칠 것
                    Text(nickname)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(background ? .ssafySoundblack : Color.ssafSoundColor(.whilte))
                        .manropeFont(family: .Bold, size: 40)
                        
                        
                    Image(asset: trackImage)
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                
                HStack() {
                    Text(campus)
                    Text("SSAFY")
                    Text(semester)
                }
                .foregroundColor(background ? .ssafySoundblack : Color.ssafSoundColor(.whilte))
                .fontWeight(.medium)
            }
            .frame(maxWidth: 320)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
        } //: ZSTACK
        .fixedSize()
    }
}

struct NameCardView_Previews: PreviewProvider {
    static var previews: some View {
        NameCardView(background: false, nickname: "James", campus: "서울캠퍼스", semester: "10기", isMajor: false, trackImage: .track_fallback_primary)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
