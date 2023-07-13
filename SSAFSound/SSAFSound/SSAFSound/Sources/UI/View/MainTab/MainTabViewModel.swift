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
}
