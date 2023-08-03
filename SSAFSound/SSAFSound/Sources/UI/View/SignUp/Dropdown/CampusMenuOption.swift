//
//  DropdownMenuOption.swift
//  SSAFSound
//
//  Created by Subeen on 2023/07/15.
//

import Foundation

struct CampusMenuOption: Identifiable, Hashable {
    let id = UUID().uuidString
    let option: String
}

extension CampusMenuOption {
    static let campus: CampusMenuOption = CampusMenuOption(option: "서울 캠퍼스")
    static let allCampus: [CampusMenuOption] = [
        CampusMenuOption(option: "서울 캠퍼스"),
        CampusMenuOption(option: "대전 캠퍼스"),
        CampusMenuOption(option: "구미 캠퍼스"),
        CampusMenuOption(option: "광주 캠퍼스"),
        CampusMenuOption(option: "부울경 캠퍼스"),
    ]
}
