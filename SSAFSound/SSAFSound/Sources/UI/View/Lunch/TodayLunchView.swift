//
//  TodayLunchView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/09/04.
//

import SwiftUI

struct TodayLunchView: View {
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea(.all)
            
            VStack {
                MainHeaerView(systemImage: "bell.fill", systemImage2: "ellipsis.message.fill")
                ScrollView(showsIndicators: false) {
                    lunchTitle()
                    chooseDayButton()
                    lunchMenuCardList()
                }
            }
        }
    }
    
    @ViewBuilder private func lunchTitle() -> some View {
        VStack {
            Spacer()
                .frame(height: 44)
            Image(asset: .today_lunch_title)
            Spacer()
                .frame(height: 7)
            Text("가장 먹고 싶은 점심메뉴는? ")
                .foregroundColor(.lightgrey)
            Spacer()
                .frame(height: 40)
        }
    }
    
    @ViewBuilder private func chooseDayButton() -> some View {
        VStack {
            Text("오늘 | 내일")
                .font(.pretendardBold24)
            .foregroundColor(.primaryDefault)
            Spacer()
                .frame(height: 38)
        }
    }
    
    
    @ViewBuilder private func lunchMenuCardList() -> some View {
        VStack(spacing: 27) {
            LunchMenuCardView(isSelected: false, count: 30)
            LunchMenuCardView(isSelected: false, count: 30)
                LunchMenuCardView(isSelected: false, count: 30)
        }
        .padding(.horizontal, 25)
    }
}

struct TodayLunchView_Previews: PreviewProvider {
    static var previews: some View {
        TodayLunchView()
    }
}
