//
//  HomeRecruitItemView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/08/21.
//

import SwiftUI

struct HomeRecruitItemView: View {
//    var category: String
//    var keyword: String
    var recruitTypes: RecruitStudyType
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
                                Text(recruitTypes.description)
                                    .font(.pretendardBold12)
                            }
                        
                        Spacer()
                        
                        // 리쿠르트 타입에 따른 색변경 기능 추가 필요!!
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
        HomeRecruitItemView(recruitTypes: .project)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
