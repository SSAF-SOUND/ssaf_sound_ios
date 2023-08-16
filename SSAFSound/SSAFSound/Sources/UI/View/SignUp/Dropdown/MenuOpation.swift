//
//  MenuOption.swift
//  SSAFSound
//
//  Created by Subeen on 2023/07/25.
//

import Foundation

struct MenuOption: Identifiable, Hashable {
    let id = UUID().uuidString
    let option: String
}

extension MenuOption {
    static let campus: MenuOption = MenuOption(option: "서울 캠퍼스")
    static let allCampus: [MenuOption] = [
        MenuOption(option: "서울 캠퍼스"),
        MenuOption(option: "대전 캠퍼스"),
        MenuOption(option: "구미 캠퍼스"),
        MenuOption(option: "광주 캠퍼스"),
        MenuOption(option: "부울경 캠퍼스"),
    ]
}

extension MenuOption {
    static let semester: MenuOption = MenuOption(option: "1기")
    static let allSemester: [MenuOption] = [
        MenuOption(option: "1기"),
        MenuOption(option: "2기"),
        MenuOption(option: "3기"),
        MenuOption(option: "4기"),
        MenuOption(option: "5기"),
        MenuOption(option: "6기"),
        MenuOption(option: "7기"),
        MenuOption(option: "8기"),
        MenuOption(option: "9기"),
        MenuOption(option: "10기"),
    ]
}
