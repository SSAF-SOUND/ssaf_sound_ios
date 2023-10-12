//
//  SettingRowView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/10/08.
//

import SwiftUI

struct SettingRowView: View {
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.pretendardBold18)
            Spacer()
            // TODO : ICON 바꾸기 
            Image(asset: .arrow_narrow_left)
        }
        .foregroundColor(.basicWhite)
        .padding(.horizontal, 25)
//        .padding(.vertical, 10)
        .frame(height: 43)
    }
}

struct SettingRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingRowView(title: "닉네임 수정")
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
