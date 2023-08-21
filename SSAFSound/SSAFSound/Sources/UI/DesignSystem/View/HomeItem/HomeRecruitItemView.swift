//
//  HomeRecruitItemView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/08/21.
//

import SwiftUI

struct HomeRecruitItemView: View {
    var category: String
//    var keyword: String
//    var recruitTypes: String
//    var skills: String
    
    var body: some View {
        ZStack {
            Color.whilte
                Text("웹 개발 프로젝트ㅇㅇㅇㅇㅇㅇㅇ")
                .multilineTextAlignment(.leading)
                .frame(maxWidth: 120, maxHeight: 40)
                .foregroundColor(.ssafySoundblack)
                .font(.pretendardBold16)
                .padding(4)
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 64, height: 22)
                            .foregroundColor(.primaryPoint)
                            .overlay {
                                Text("프로젝트")
                                    .font(.pretendardBold12)
                            }
                        
                        Spacer()
                        
                        Text("D-5")
                            .foregroundColor(.primaryPoint)
                            .font(.pretendardBold16)
                            .padding(.trailing, 4)
                    }
                    
                    Spacer()

            }
                .padding(10)
        }
        .cornerRadius(20)
        .frame(width: 140, height: 140)
    }
}



struct HomeRecruitItemView_Previews: PreviewProvider {
    static var previews: some View {
        HomeRecruitItemView(category: "프로젝트")
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
