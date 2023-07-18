//
//  RecruitView.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/07/16.
//

import SwiftUI

struct RecruitView: View {
    @State var serachRecuritText: String = ""
    @State private var selectTabView: Int = 0
    @State private var selectId: String = ""
    @Binding var selectTab: RecruitStudyType
    @State private var selectToggle: Bool = false
    @State private var selectRecruitTap: Bool = false
    
    
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                recuritTopHeaderView()
                
                searchRecuirTextFieldView()
                
                recruitSelectTabView(selectTab: selectTab)
                
                
                
                Spacer()
            }
        }
    }
    
    
    @ViewBuilder
    private func recuritTopHeaderView() -> some View {
        Spacer()
            .frame(height: 14)
        
        HStack {
            Image(asset: .logo)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.screenWidth/4 , height: 22)
            
            Spacer()
            
            HStack {
                Image(systemName: "bell.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.whilte)
                
                Spacer()
                    .frame(width: 20)
                
                Image(systemName: "ellipsis.message.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.whilte)
                
                
                
            }
            
        }
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    private func searchRecuirTextFieldView() -> some View {
        Spacer()
            .frame(height: 30)
        
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(height: 42)
                .overlay {
                    HStack {
                        TextField("검색어를 입력해주세요", text: $serachRecuritText)
                            .manropeFont(family: .Medium, size: 18)
                            .kerning(-0.3)
                        
                        Spacer()
                        
                        
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 15)
                        
                        
                    }
                    .padding(.horizontal, 20)
                }
                
        }
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    private func recruitSelectTabView(selectTab: RecruitStudyType) -> some View {
        Spacer()
            .frame(height: 30)
        
        VStack {
            HStack(spacing: 0) {
                ForEach(RecruitStudyType.allCases, id: \.self) { item in
                    VStack(spacing: 0) {
                        Text(item.description)
                            .manropeFont(family: .Bold, size: 20)
                            .foregroundColor(item == .project ? .primaryPoint  : .secondaryDefault)
                            .frame(maxWidth: .infinity / 4, minHeight: 50)
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    self.selectTab = item
                                    selectTabView = item.index
                                    self.selectId = UUID().uuidString
                                }
                            }
                        
                        if selectTab == item {
                            Capsule()
                                .foregroundColor(selectTab == .project ? .primaryPoint: .secondaryDefault)
                                .frame(height: 3)
                                .id(UUID().uuidString)
                        }
                    }
                    .contentShape(Rectangle())
                }
            }
            
            selectRecruiTabViews(selectTab: selectTab)
        }
    }
    
    @ViewBuilder
    private func selectRecruiTabViews(selectTab: RecruitStudyType) -> some View {
        if selectTab == .project {
            RecruitProjecView()
        } else  {
            RecruitStudyView()
        }
    }
    
    
}

struct RecruitView_Previews: PreviewProvider {
    static var previews: some View {
        RecruitView(selectTab: .constant(.project))
    }
}
