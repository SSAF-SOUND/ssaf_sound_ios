//
//  PrivateProfileView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/08/23.
//

import SwiftUI

struct PrivateProfileView: View {
    var body: some View {
        ZStack {
            Color.background
            VStack(spacing: 30) {
                Text("내 프로필 비공개")
                    .font(.pretendardBold18)
                    .foregroundColor(.primaryDefault)
            
                Image(asset: .track_fallback_primary)
            }
        }
    }
}

struct PrivateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        PrivateProfileView()
            .previewLayout(.sizeThatFits)
    }
}
