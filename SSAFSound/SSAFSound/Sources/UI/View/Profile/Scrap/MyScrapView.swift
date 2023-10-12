//
//  MyScrapView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/10/08.
//

import SwiftUI

struct MyScrapView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea(.all)
                VStack {
                    header()
                    ScrapView()

                }
            }
            .navigationTitle("나의 스크랩")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

@ViewBuilder
private func header() -> some View {
    var isChecked: Bool = true
    
    VStack {
        Spacer()
            .frame(height: 25)
        HStack {
            Button {
                isChecked = true
            } label: {
                HStack {
                    Text("게시글")
                        .foregroundColor(isChecked ? .primaryDefault : .basicWhite)
                    Text("|")
                        .foregroundColor(.basicWhite)
                    Text("리쿠르트")
                        .foregroundColor(isChecked ? .basicWhite : .primaryDefault)
                }
            }
        }
    }
}

// TODO: 스크랩과 글 연결
@ViewBuilder
private func ScrapView() -> some View {
    ScrollView(showsIndicators: false) {
        VStack {
            MyScrapBoardView(board: "자유게시판", title: "아니 오늘 건물 1층에서", subtitle: "이재용 본 것 같은데", like: 12, comment: 7)
                .padding(23)
            Spacer()
        }
    }

}


struct MyScrapView_Previews: PreviewProvider {
    static var previews: some View {
        MyScrapView()
    }
}
