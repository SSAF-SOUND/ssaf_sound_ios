//
//  MainTabView.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/07/13.
//

import SwiftUI
import Nuke

struct MainTabView: View {
    @StateObject private var viewModel: MainTabViewModel = MainTabViewModel()

    init() {
        // Customize the tab bar appearance
        UITabBar.appearance().tintColor = UIColor(Color.gray)
        UITabBar.appearance().barTintColor = UIColor(Color.white)
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.gray)
    }

    var body: some View {
        ZStack {
            Color.ssafSoundColor(.black)
                .edgesIgnoringSafeArea(.all)

            NavigationStack {
                TabView(selection: $viewModel.selectTabItem) {
                    ContentView()
                        .tabItem {
                            TabItemViews(image: "house", tabName: MainTabType.home.description, isSelected: viewModel.selectTabItem == 0)
                        }
                        .tag(0)
                    
                    BoardView()
                        .tabItem {
                            TabItemViews(image: "list.bullet.rectangle.fill", tabName: MainTabType.board.description, isSelected: viewModel.selectTabItem == 1)
                        }
                        .tag(1)

                    ContentView()
                        .tabItem {
                            TabItemViews(image: "person.badge.plus", tabName: MainTabType.recruit.description, isSelected: viewModel.selectTabItem == 2)
                        }
                        .tag(2)

                    ContentView()
                        .tabItem {
                            TabItemViews(image: "person.crop.circle", tabName: MainTabType.profile.description, isSelected: viewModel.selectTabItem == 3)
                        }
                        .tag(3)
                }
                .accentColor(.ssafSoundColor(.black))
                
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
