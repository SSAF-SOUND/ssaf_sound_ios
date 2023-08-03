//
//  BackButtonView.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/07/16.
//

import SwiftUI

public struct BackButtonView: View {
    var title: String
    var spacingWidth: CGFloat
    var backButtonAction: () -> Void = {}
    var showTitle: Bool
    
    
    public init(title: String, spacingWidth: CGFloat, backButtonAction: @escaping () -> Void, showTitle: Bool) {
        self.title = title
        self.spacingWidth = spacingWidth
        self.backButtonAction = backButtonAction
        self.showTitle = showTitle
        
    }
    
    public var body: some View {
        HStack {
            Image(systemName: "arrow.left")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .onTapGesture {
                    backButtonAction()
                }
            
           
            
            if showTitle {
                Spacer()
                    .frame(width: spacingWidth)
                
                Text(title)
                    .manropeFont(family: .Bold, size: 16)
                    
            }
            
            
            Spacer()
            
        }
        .foregroundColor(.white)
        .padding(.horizontal, 20)
    }
}

struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonView(title: "sss", spacingWidth: UIScreen.screenWidth/3 - 10, backButtonAction: {}, showTitle: false)
    }
}

