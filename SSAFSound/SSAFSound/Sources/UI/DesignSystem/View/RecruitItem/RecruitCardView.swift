//
//  RecruitCardView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/08/23.
//

import SwiftUI

struct RecruitCardView: View {
    
    var isMine: Bool    // true : MY 표시 활성화, false : MY 표시 비활성화
    var type: RecruitStudyType
    
    var body: some View {
        ZStack {
            backgroundButton()
                .overlay {
                    VStack(alignment: .leading, spacing: 10) {
                        showTitle2()
                        showSkills()
                        
                    }
                    .padding(.leading, 25)

                }
        }
    }
    
    
    @ViewBuilder
    private func backgroundButton() -> some View {
        Rectangle()
//            .frame(width: 340, height: 150)
//            .frame(width: 340, height: 150, maxHeight: 190)
            .cornerRadius(30)
            .frame(height: 140)
            .frame(maxHeight: 190)
            
            .foregroundColor(.basicWhite)
            .fixedSize(horizontal: false, vertical: true)
    }
    
    @ViewBuilder
    private func showTitle2() -> some View {
        Spacer()
            .frame(height: 17)
        VStack() {
            Spacer()
                .frame(height: 17)
            HStack(alignment: .top, spacing: 0) {
                VStack(alignment: .leading, spacing: 3) {
                    if isMine {
                        Capsule()
                            .frame(width: 40, height: 20)
                            .foregroundColor(.backgroundGray)
                            .overlay {
                                Text("MY")
                                    .foregroundColor(.basicWhite)
                                    .font(.pretendardBold14)
                            }
                    }
                    
                    Text("커뮤니티 웹프로젝ddddddddddㅇddd")
                        
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.basicBlack)
                    .padding(.top, 4)
                }

                    
                    
//                Spacer()
                Text("D-5")
                    .foregroundColor(type == RecruitStudyType.project ? .primaryPoint : .secondaryPoint)
            }
            .font(.pretendardBold20)
            .padding(.trailing, 25)
//            Spacer()
        }
//        .padding(.top, 20)
//        .padding(.leading, 25)
    }
    
    

    
    @ViewBuilder
    private func showSkills() -> some View {
        HStack(spacing: 3) {
            ForEach(1...5, id: \.self) { _ in
                Circle()
                    .frame(width: 16, height: 16)
                    .foregroundColor(.primaryDefault)
            }
        }
        Spacer()
//            .frame(height: 30)
        
    }
}

struct RecruitCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecruitCardView(isMine: true, type: .project)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
