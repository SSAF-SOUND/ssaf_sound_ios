//
//  SearchView.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/25.
//

import SwiftUI

enum resultType {
    case start
    case success
    case fail
}

struct SearchView: View {
    
    @State var serachBoardText: String = ""
    @State private var currentResult: resultType = .fail
    
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            NavigationStack{
                VStack{
                    searchBoardTextFieldView()
                    if serachBoardText != "" {
                        Text("'"+serachBoardText+"'"+" 검색 결과")
                            .manropeFont(family: .Regular, size: 18)
                            .foregroundColor(Color.white)
                        
                    }else{
                        Text("")
                    }
                    getResultView()
                }
            }
        }
        
    }
    @ViewBuilder
    private func searchBoardTextFieldView() -> some View {
        Spacer()
            .frame(height: 8)
        
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(height: 42)
                .overlay {
                    HStack {
                        TextField("검색어를 입력해주세요", text: $serachBoardText)
                            .manropeFont(family: .Medium, size: 18)
                            .kerning(-0.3)
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 18, height: 15)
                                .foregroundColor(.ssafySoundblack)
                        }

                        
                            
                        
                        
                    }
                    .padding(.horizontal, 20)
                }
                
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
    }
    
    @ViewBuilder
       private func getResultView() -> some View {
           switch currentResult {
           case .success:
               successResultView()
           case .fail:
               failResultView()
           case .start:
               defaultView()
           }
       }
    
    @ViewBuilder
    private func successResultView() -> some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0){
                    HStack(alignment: .bottom) {
                        Text("00게시판")
                            .manropeFont(family: .Bold, size: 12)
                            .foregroundColor(.purplePoint)
                        Spacer()
                        BoardInteractionStats()
                    }
                    Text("제목 위치제목 위치제목 위치제목 위치제목 위치제목 위치제목 위치제목 위치제목 위치제목 위치")
                        .manropeFont(family: .Bold, size: 14)
                        .lineLimit(1)
                        .foregroundColor(.white)
                        .padding(.bottom,12)
                    Text("게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용게시글 내용")
                        .manropeFont(family: .Regular, size: 14)
                        .foregroundColor(.white)
                        .lineLimit(1)
                    Text("n분전 | 게시자")
                        .manropeFont(family: .Bold, size: 14)
                        .foregroundColor(.white)
                }
                    .padding(EdgeInsets(top: 14, leading: 22, bottom: 14, trailing: 22))
                    .frame(height: 123)
                    .background(Color.bluegrey)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(red: 0.53, green: 0.56, blue: 0.66), lineWidth: 1)
                    )
            }
            .padding(.horizontal, 25)
        }
        
    }
    
    @ViewBuilder
    private func failResultView() -> some View {
        VStack{
            Spacer()
                .frame(height: 118)
            Image(asset: .track_fallback_primary)
                .resizable()
                .scaledToFit()
                .frame(width: 131, height: 162)
            Text("검색한 결과가 없습니다")
                .manropeFont(family: .Regular, size: 16)
                .foregroundColor(.secondaryStrong)
            Spacer()
        }
    }
    
    @ViewBuilder
    private func defaultView() -> some View {
        Spacer()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
            SearchView()

    }
}