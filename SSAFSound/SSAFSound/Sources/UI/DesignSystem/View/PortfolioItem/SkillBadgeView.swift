//
//  SkillBadgeView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/09/20.
//

import SwiftUI

struct SkillBadgeView: View {
//    var icon:
    var skill: TechStackType
    @State var isSelected: Bool
    var body: some View {
        badgeView()
    }
    
    @ViewBuilder
    private func badgeView() -> some View {
        
        Button {
            isSelected.toggle()
        } label: {
            ZStack {
               
                HStack(spacing: 8) {
                    Image(assetName: skill.rawValue)
                    Text(skill.description)
                        .foregroundColor(.basicWhite)
                        .font(.pretendardRegualar14)

                }
                .padding(.vertical, 6)
                .padding(.horizontal, 12)

            }
            .background(RoundedRectangle(cornerRadius: 15).fill(isSelected ? Color.ssafSoundColor(.primaryDark) : .clear))
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(isSelected ? Color.ssafSoundColor(.primaryDark) : Color.ssafSoundColor(.basicWhite), lineWidth: 1)
            }
        }

        
    }
}

struct SkillBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        SkillBadgeView(skill: .ios, isSelected: true)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
