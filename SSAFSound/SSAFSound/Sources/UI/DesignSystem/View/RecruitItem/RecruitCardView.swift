//
//  RecruitCardView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/08/23.
//

import SwiftUI

struct RecruitCardView: View {
    var body: some View {
        Button {
            
        } label: {
            Rectangle()
                .frame(width: 340, height: 150)
                .cornerRadius(30)
                .foregroundColor(.basicWhite)
                .overlay {
                    VStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            Text("커뮤니티 웹프로젝트ddd daㅇㅇㅇㅇㅇㅇ")
                                .frame(width: 236)
                                .multilineTextAlignment(.leading)
                                
                                
                            
                            Text("D-5")
                                .padding(.bottom, 4)
                        }
                        .padding(.trailing, 25)
                        Spacer()
                    }
                    .padding(.vertical, 20)
                    .padding(.leading, 25)
                }
                
                
        }

    }
}

struct RecruitCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecruitCardView()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
