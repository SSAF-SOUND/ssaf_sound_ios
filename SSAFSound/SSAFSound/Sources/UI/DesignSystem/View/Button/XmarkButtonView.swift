//
//  XmarkButtonView.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/07/16.
//

import SwiftUI


public struct XmarkButtonView: View {
    var width: CGFloat
    var height: CGFloat
    var spacingWidth: CGFloat
    var xmarkAction: () -> Void = {}

    var title: String
    var showTitle: Bool
    
    public init(xmarkAction: @escaping () -> Void, width: CGFloat, height: CGFloat, showTitle: Bool ,title: String,spacingWidth: CGFloat) {
        self.width = width
        self.height = height
        self.spacingWidth = spacingWidth
        self.xmarkAction = xmarkAction
        self.title = title
        self.showTitle = showTitle

    }
    
    public var body: some View {
        Spacer()
            .frame(height: 20)
        
        HStack {
            Image(systemName: "xmark")
                .resizable()
                .scaledToFit()
                .frame(width: width, height: height)
                .onTapGesture {
                    xmarkAction()
                }
            
           
            
            if showTitle {
                Spacer()
                    .frame(width: spacingWidth)
                
                Text(title)
                    .manropeFont(family: .Bold, size: 16)
            }
            
            
            Spacer()
            
        }
        .padding(.horizontal, 20)
    }
}


struct XmarkButtonView_Previews: PreviewProvider {
    static var previews: some View {
        XmarkButtonView(xmarkAction: {}, width: 20, height: 20, showTitle: true, title: "sssss", spacingWidth: UIScreen.screenWidth/3)
    }
}
