//
//  MyPorfolioDefaultView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/08/23.
//

import SwiftUI

struct MyPorfolioDefaultView: View {
    var body: some View {
        ZStack {
            Color.background
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: 20)
                Button {
                    
                } label: {
                    Rectangle()
                        .frame(width: 339, height: 35)
                        .cornerRadius(8)
                        .foregroundColor(.fontBlueBlack)
                        .overlay {
                            Text("입력하기")
                                .font(.pretendardBold16)
                                .foregroundColor(.basicWhite)
                        }
                    
                }
                Spacer()
                    .frame(height: 68)

                Text("아직 입력된 포트폴리오 내용이 없습니다")
                    .font(.pretendardRegualar16)
                    .foregroundColor(.primaryDefault)
                
                Spacer()
                    .frame(height: 28)
            
                Image(asset: .track_fallback_primary)
                Spacer()
            }
        }
        .frame(height: 600)
    }
}

struct MyPorfolioDefaultView_Previews: PreviewProvider {
    static var previews: some View {
        MyPorfolioDefaultView()
            .previewLayout(.sizeThatFits)
    }
}
