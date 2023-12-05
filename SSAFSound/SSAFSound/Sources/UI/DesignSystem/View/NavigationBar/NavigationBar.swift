//
//  NavigationBar.swift
//  SSAFSound
//
//  Created by Subeen on 2023/12/05.
//

import SwiftUI

import SwiftUI

struct NavigationBar: View {
    let isDisplayLeadingBtn: Bool
    let isDisplayTrailingBtn: Bool
    
    let title: String
    
    let leadingItems: [(ImageAsset, () -> Void)]
    let trailingItems: [(ImageAsset, () -> Void)]
    
    init(
        isDisplayLeadingBtn: Bool = true,
        isDisplayTrailingBtn: Bool = false,
        title: String = "로그인",
        leadingItems: [(ImageAsset, () -> Void)] = [(.arrow_narrow_left, {})],
        trailingItems: [(ImageAsset, () -> Void)] = [(.arrow_narrow_left, {})]
    ) {
        self.isDisplayLeadingBtn = isDisplayLeadingBtn
        self.isDisplayTrailingBtn = isDisplayTrailingBtn
        self.title = title
        self.leadingItems = leadingItems
        self.trailingItems = trailingItems
    }
    
    var body: some View {
        ZStack {
            Color.background
            HStack(spacing: 0) {
                if isDisplayLeadingBtn {
                    ForEach(leadingItems, id: \.0, content: { item in
                        Button(
                            action: {
                                item.1()
                            },
                            label: {
    //                            item.0.image
                                
                                Image(asset: item.0)
                                    
                            }
                        )
                    })
                }
                Spacer()
                
                Text(title)
                    .font(.manropeRegualar16)
                    .foregroundColor(.basicWhite)
                
                Spacer()
                
                if isDisplayTrailingBtn {
                    ForEach(trailingItems, id: \.0, content: { item in
                        Button(
                            action: {
                                item.1()
                            },
                            label: {
//                                item.0.image
                                Image(asset: item.0)
                            }
                        )
                        .padding(.leading, 18)
                    })
                }
            }
            .padding(.horizontal, 20)
        
        }
        .frame(height: 44)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
            .previewLayout(.sizeThatFits)
    }
}
