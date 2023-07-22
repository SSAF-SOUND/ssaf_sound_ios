//
//  TabItemViews.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/07/13.
//

import SwiftUI


public struct TabItemViews: View {
    
    let image: String
    let tabName: String
    let isSelected: Bool
    
    public init(image: String, tabName: String, isSelected: Bool) {
        self.image = image
        self.tabName = tabName
        self.isSelected = isSelected
    }
    
    public var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Image(systemName: image)
                .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            
            
//            Spacer()
//                .frame(height: 20)
            
            Text(tabName)
                .manropeFont(family: .Medium, size: 12)
            
            Spacer()
        }
        .foregroundColor(isSelected ? .ssafySoundblack : .gray)
        .frame(width: 90, height: 90)
    }
}

struct TabItemViews_Previews: PreviewProvider {
    static var previews: some View {
        TabItemViews(image: "home",  tabName: "홈",  isSelected: false)
            .previewLayout(.fixed(width: 80, height: 80))
    }
}
