//
//  MainHeaerView.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/08/24.
//

import Foundation
import SwiftUI

struct MainHeaerView: View {
    
    var systemImage: String
    var systemImage2: String
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 20)
            
            HStack {
                Image(asset: .logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.screenWidth/4 , height: 22)
                
                Spacer()
                
                HStack {
                    Image(systemName: systemImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.whilte)
                    
                    Spacer()
                        .frame(width: 20)
                    
                    Image(systemName: systemImage2)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.whilte)
                }
                
            }
            .padding(.horizontal, 25)
        }
    }
}
