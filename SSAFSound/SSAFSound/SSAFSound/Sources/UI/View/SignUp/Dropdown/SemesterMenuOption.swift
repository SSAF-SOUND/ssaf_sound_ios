//
//  DropdownMenuOption.swift
//  SSAFSound
//
//  Created by Subeen on 2023/07/15.
//

import Foundation

struct SemesterMenuOption: Identifiable, Hashable {
    let id = UUID().uuidString
    let option: String
}

extension SemesterMenuOption {
    static let semester: SemesterMenuOption = SemesterMenuOption(option: "1기")
    static let allSemester: [SemesterMenuOption] = [
        SemesterMenuOption(option: "1기"),
        SemesterMenuOption(option: "2기"),
        SemesterMenuOption(option: "3기"),
        SemesterMenuOption(option: "4기"),
        SemesterMenuOption(option: "5기"),
        SemesterMenuOption(option: "6기"),
        SemesterMenuOption(option: "7기"),
        SemesterMenuOption(option: "8기"),
        SemesterMenuOption(option: "9기"),
        SemesterMenuOption(option: "10기"),
    ]
}
