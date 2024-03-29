//
//  RecruitStudyView.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/07/18.
//

import SwiftUI

struct RecruitStudyView: View {
    @State private var selectToggle: Bool = false
    
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                recruitStudtTopHeaderView()
                
                Spacer()
                
            }
        }
    }
    
    @ViewBuilder
    private func recruitStudtTopHeaderView() -> some View  {
        VStack {
            HStack {
                Toggle("", isOn: $selectToggle)
                    .toggleStyle(RecuritCustomToggle(activeColor: Color.secondaryDefault, activeCircle: selectToggle, height: 30, width: 100))
                
                Spacer()
                    .frame(width: 10)
                
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, style: .init(lineWidth: 2))
                    .frame(width: 97, height: 28)
                    .overlay {
                        HStack {
                            HStack {
                                Text("상세 옵션")
                                    .foregroundColor(.whilte)
                                    .manropeFont(family: .Medium, size: 12)
                                    .kerning(-0.3)
                                
                                Image(systemName: "arrowtriangle.down.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 14, height: 14)
                                    .foregroundColor(.whilte)
                            }
                            
                        }
                    }
                
                Spacer()
                
                Circle()
                    .fill(Color.secondaryDefault)
                    .frame(width: 43, height: 43)
                    .overlay {
                        Image(asset: .pencil)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                
                
            }
            .padding(.horizontal, 20)
        }
    }
}

struct RecruitStudyView_Previews: PreviewProvider {
    static var previews: some View {
        RecruitStudyView()
    }
}
