//
//  ProfleView.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/07/20.
//

import SwiftUI

struct ProfileView: View {
//    @State var serachRecuritText: String = ""
    @State private var selectTabView: Int = 0
    @State private var selectId: String = ""
    @Binding var selectTab: ProfileMenuType
    
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea(.all)
            
            VStack {
                MainHeaerView(systemImage: "bell.fill", systemImage2: "ellipsis.message.fill")
                ScrollView(showsIndicators: false) {
                    VStack {
 
                        HStack {
                            NameCardView(background: false, nickname: "James", campus: "서울 캠퍼스", semester: "12기", isMajor: true, trackImage: .track_fallback_primary)
                                .padding(.leading, 25)
                                .padding(.top, 31)
                            Spacer()
                        }
                        Spacer()
                            .frame(height: 45)
                        
                        ProfileMenuButtonView()
                        
                        Spacer()
                            .frame(height: 51)
                        
    //                    SegmentedControlView(selectedColor: Color.basicWhite, unselectedColor: Color.fontBlueBlack)
                        segmentedControlView(selectTab: selectTab)
                        
    //                    MyPorfolioDefaultView()
                        
                        Spacer()
                    }
                }
            }
        }
    }
    @ViewBuilder
    private func recruitTopHeaderView() -> some View {
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
        .padding(.horizontal, 25)
    }

    @ViewBuilder
    private func segmentedControlView(selectTab: ProfileMenuType) -> some View {
        Spacer()
            .frame(height: 30)
        
        VStack {
            HStack(spacing: 0) {
                ForEach(ProfileMenuType.allCases, id: \.self) { item in
                    VStack(spacing: 0) {
                        Text(item.description)
                            .manropeFont(family: .Bold, size: 20)
                            .foregroundColor(selectTabView == item.index ? .basicWhite  : .fontBlueBlack)
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
                                .foregroundColor(selectTabView == item.index ? .basicWhite  : .fontBlueBlack)
                                .frame(height: 3)
                                .id(UUID().uuidString)
                        }
                    }
                    .contentShape(Rectangle())
                }
            }
            
            selectProfileMenu(selectTab: selectTab)
        }
    }

    @ViewBuilder
    private func selectProfileMenu(selectTab: ProfileMenuType) -> some View {
        if selectTab == .portfolio {
            MyPorfolioDefaultView()
        } else  {
            RecruitCardView()
        }
    }
}



struct ProfleView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(selectTab: .constant(.portfolio))
    }
}
