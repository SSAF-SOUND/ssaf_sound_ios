//
//  PortfolioEditorVIew.swift
//  SSAFSound
//
//  Created by Subeen on 2023/08/23.
//

import SwiftUI

struct PortfolioEditorVIew: View {
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea(.all)
            VStack {
                titleView()
            }
        }
        
    }
    
    @ViewBuilder
    private func titleView() -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("My Portfolio")
                    .foregroundColor(Color.ssafSoundColor(.primaryDefault))
                    .font(.pretendardBold32)
                Text("나만의 포트폴리오를 꾸며보세요!")
                    .foregroundColor(.basicWhite)
                    .font(.pretendardRegualar18)
            }
            .padding(.leading, 30)
            Spacer()
        }
        .padding(.top, 24)
        Spacer()
        
        
    }
}

struct PortfolioEditorVIew_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioEditorVIew()
    }
}
