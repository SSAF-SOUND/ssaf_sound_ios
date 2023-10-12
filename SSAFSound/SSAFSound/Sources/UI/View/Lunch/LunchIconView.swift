//
//  LunchIconView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/09/21.
//

import SwiftUI

struct LunchIconView: View {
    
    @State var isSelected: Bool
    var mainMenu: String
    var imagePath: String
    var pollCount: Int
    var body: some View {
        iconView()
    }
    
    @ViewBuilder private func iconView() -> some View {
        VStack(spacing: 0) {
            HStack {
                Text("\(pollCount)")
                    .font(.pretendardBold16)
                    .foregroundColor(.basicBlack)
            }
            Button {
                isSelected.toggle()
            } label: {
                Image(asset: .test_lunch)
                
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay {
                        if isSelected {
                            ZStack {
                                Color.basicBlack.opacity(0.5)
                                Text(mainMenu)
                                    .font(.pretendardBold14)
                                    .foregroundColor(.basicWhite)
                            }
                        }
                        else { Color.clear }
                    }
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
                    .clipped()
            }
        }
    }
}

struct LunchIconView_Previews: PreviewProvider {
    static var previews: some View {
        LunchIconView(isSelected: true, mainMenu: "된장찌개", imagePath: " ", pollCount: 20)
            .previewLayout(.sizeThatFits)
    }
}
