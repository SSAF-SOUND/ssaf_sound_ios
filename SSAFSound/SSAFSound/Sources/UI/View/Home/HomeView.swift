//
//  HomeView.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/07/20.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: BoardViewModel = BoardViewModel()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .task {
                viewModel.requestRecurit()
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
