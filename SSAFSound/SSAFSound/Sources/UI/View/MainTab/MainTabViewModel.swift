//
//  MainTabViewModel.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/07/13.
//

import Foundation


class MainTabViewModel: ObservableObject {
    @Published var selectTabItem: Int = 0
    @Published var selctTabindex: Int = .zero
    @Published var selctTabType: MainTabType = .home
    @Published var selectRecirtType: RecruitStudyType = .project
    
    // MARK: - 프로필에서 segmented control (포트폴리오, 스터디, 프로젝트)
    @Published var selectProfileMenyType: ProfileMenuType = .portfolio
}
