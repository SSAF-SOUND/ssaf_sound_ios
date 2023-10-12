//
//  ProfileSettingView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/10/05.
//

import SwiftUI

struct ProfileSettingView: View {
    let coloredNavAppearance = UINavigationBarAppearance()
    
    
    var body: some View {
        
        
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea(.all)
                VStack {
                    header("내 정보")
                    myInfoView()
                    header("SSAFY 정보")
                    ssafyInfoView()
                    logoutView()
                    Spacer()
                    
                }
                
                
            }
            .navigationTitle("프로필 설정")
            .navigationBarTitleDisplayMode(.inline)
        }

    }
}

@ViewBuilder
private func header(_ title: String) -> some View {
    VStack {
        HStack {
            Text(title)
            Spacer()
        }
        .foregroundColor(.fontBlueBlack)
        .font(.pretendardBold14)
        .padding(.horizontal, 25)
        .padding(.top, 38)
    }
}


@ViewBuilder
private func myInfoView() -> some View {
    VStack(spacing: 0) {
        SettingRowView(title: "닉네임 수정")
        SettingRowView(title: "재학생 인증")
        SettingRowView(title: "내 프로필 인증")
    }
}

@ViewBuilder
private func ssafyInfoView() -> some View {
    VStack(spacing: 0) {
        SettingRowView(title: "SSAFY 기수")
        SettingRowView(title: "SSAFY 캠퍼스")
        SettingRowView(title: "SSAFY 전공자")
        SettingRowView(title: "SSAFY 트랙")
    }
}

@ViewBuilder
private func logoutView() -> some View {
    VStack(spacing: 0) {
        Rectangle()
            .frame(height: 1)
            .foregroundColor(.fontBlueBlack)
        SettingRowView(title: "로그아웃")
    }
}



struct ProfileSettingView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingView()
    }
}
