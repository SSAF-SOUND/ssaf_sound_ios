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
            ScrollView {
                VStack {
                    titleView()
                    editorView()
                    techStackView()
                    linkView()
                }
                .padding(.horizontal, 30)
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
            
            Spacer()
        }
        .padding(.top, 24)
        Spacer()
    }
    
    @ViewBuilder
    private func editorView() -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("⓵ 500자 내외로 짧지만 강렬한 자기소개를 작성해보세요")
                    .font(.pretendardRegualar14)
                    .foregroundColor(.basicWhite)
            }
            Spacer()
        }
        .padding(.top, 40)
    }
    
    @ViewBuilder
    private func techStackView() -> some View {
        let columns = [
//                GridItem(.adaptive(minimum: 110))
            GridItem(.adaptive(minimum: 100), spacing: 0)
            ]
        
        HStack {
            VStack(alignment: .leading) {
                Text("② 사용하시는 기술스택을 자유롭게 골라주세요")
                    .font(.pretendardRegualar14)
                    .foregroundColor(.basicWhite)
                
                Spacer()
                    .frame(height: 20)
                
                LazyVGrid(columns: columns, alignment: .center) {
                    ForEach(TechStackType.allCases) { stack in
                        Button {
                            print("tt")
                        } label: {
                            SkillBadgeView(skill: stack, isSelected: false)
                        }
                    }
                }
            }
            
            Spacer()

        }
        .padding(.top, 40)
    }
    
    @ViewBuilder
    private func linkView() -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("③ 더 담고 싶으신 내용을 Link로 남겨주세요 :)")
                    
                    .foregroundColor(.basicWhite)
                Spacer()
                    .frame(height: 5)
                Text("( 링크 제목 20자 이내 )")
                    .foregroundColor(.fontBlueBlack)
            }
            .font(.pretendardRegualar14)
            Spacer()
        }
        .padding(.top, 40)
    }
}

struct PortfolioEditorVIew_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioEditorVIew()
    }
}
