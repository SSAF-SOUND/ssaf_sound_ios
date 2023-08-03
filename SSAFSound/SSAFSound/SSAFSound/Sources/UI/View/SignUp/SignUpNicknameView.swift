//
//  SignUpNicknameView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/07/24.
//

import SwiftUI

struct SignUpNicknameView: View {
    private var title: String = """
                                닉네임을\n입력해주세요
                                """
    
    @State var test: String = ""
    
    

    var body: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
            
            VStack {
                ProgressView("Loading...", value: 1.0, total: 1)
                    .progressViewStyle(CustomProgressBar()
                    )
                
                
                Spacer()
                    .frame(height: 60)
                
                
                // SSAFSOUND 한글 B/28
                Text(title)
                    .font(
                        Font.manropeFont(family: .Bold, size: 28)
                    )
                    .foregroundColor(.white)
                    .frame(width: 344, height: 84, alignment: .topLeading)
                
                HStack(spacing: 7) {
                    Spacer()
                    Text("랜덤 닉네임 생성")
                        .font(Font.manropeFont(family: .Light, size: 12))
                        .foregroundColor(.white)
                    
                    Image(systemName: "arrow.counterclockwise")
                        .foregroundColor(.white)
                }
                .padding(.trailing, 34)
                
                TextField(
                    "Hello",
                    text: $test,
                    prompt: Text("Enter").foregroundColor(.bluegrey)
                )
                .font(Font.manropeFont(family: .Light, size: 16))
                .frame(width: 303, height: 24)
                .padding(.horizontal, 16)
                .padding(.vertical, 14)
                .background(.white)
                .foregroundColor(Color.ssafSoundColor(.black))
                .cornerRadius(10)
                
                
                
                Spacer()
                    .frame(height: 417) // 이미지 넣고 수정
                
            
                Button {
                    

                } label: {
                    Rectangle()
                        .fill(Color.ssafSoundColor(.primaryDefault))
                        .opacity(test.isEmpty ? 0.6 : 1)
                        .frame(width: 338, height: 56)
                        .cornerRadius(8)
                        .overlay(Text("네"))
                        .foregroundColor(Color.ssafSoundColor(.black))
                }.disabled(test.isEmpty)
                
                Spacer()
            }
        }
    }
}

struct SignUpNicknameView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpNicknameView()
    }
}
