//
//  TodayLunchCardView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/09/21.
//

import SwiftUI

struct LunchPreviewView: View {
    @StateObject var lunchViewModel = LunchViewModel()
    
    var body: some View {
       lunchCardView()
    }
    
    
    @ViewBuilder private func lunchCardView() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
            .frame(width: 340, height: 206)
            
            VStack(spacing: 0) {
                title()
                lunchIcon()
            }
        }
    }
    
    @ViewBuilder private func title() -> some View {
        HStack(spacing: 56) {
            Image(asset: .today_lunch)
            Text("투표하기")
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.basicBlack, lineWidth: 1)
                        .frame(width: 84, height: 30)
                }
        }
    }
    
    @ViewBuilder private func lunchIcon() -> some View {
        
        // TODO: 통신 안 됨
//        HStack {
//            Text(lunchViewModel.lunchModel?.data.menus[0].extraMenu ?? "메뉴 없음")
//                .foregroundColor(.basicBlack)
//            Text(lunchViewModel.lunchModel?.data.menus[0].imagePath ?? "이미지 없음")
//                .foregroundColor(.basicBlack)
//            Image("http://samsungwelstory.com/data/manager/recipe/E110/20230922/s20200522192846.jpg")
//        }
        
        VStack {
            Spacer()
                .frame(height: 100)
            HStack(spacing: 30) {
                LunchIconView(isSelected: false, mainMenu: "된장찌개", imagePath: " ", pollCount: 20)
                LunchIconView(isSelected: true, mainMenu: "된장찌개", imagePath: " ", pollCount: 20)
                LunchIconView(isSelected: false, mainMenu: "된장찌개", imagePath: " ", pollCount: 20)
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

struct LunchPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        LunchPreviewView()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)

    }
}
