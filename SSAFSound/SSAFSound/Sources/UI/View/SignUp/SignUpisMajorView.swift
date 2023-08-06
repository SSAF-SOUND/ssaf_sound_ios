//
//  SignUpIsMajorView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/07/24.
//

import SwiftUI

import SwiftUI

struct SignUpIsMajorView: View {
    
    private var title: String = """
                                컴퓨터공학 관련\n전공자이신가요?
                                """
    @State private var nextView: Bool = false
    
    var body: some View {
        NavigationStack() {
            ZStack {
                Color.background.edgesIgnoringSafeArea(.all)
                
                VStack {
                    ProgressView("Loading...", value: 0.8, total: 1)
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
                    
                    Spacer()
                        .frame(height: 417) // 이미지 넣고 수정
                    
                
                    HStack {
                        
                        Button {
                            nextView.toggle()
                        } label: {
                            Rectangle()
                                .fill(Color.ssafSoundColor(.primaryDefault))
                                .frame(width: 160, height: 56)
                                .cornerRadius(8)
                                .overlay(Text("네"))
                                .foregroundColor(Color.ssafySoundblack)
                        }
                        
                        
                        NavigationLink(destination: SignUpNicknameView()) {
                            Button(action: {}) {
                                Rectangle()
                                    .fill(Color.ssafSoundColor(.whilte))
                                    .frame(width: 160, height: 56)
                                    .cornerRadius(8)
                                    .overlay(Text("아니오"))
                                    .foregroundColor(Color.ssafySoundblack)
                            }
                        }
                        
                        
                    }
                    Spacer()
                }
            }
            .navigationDestination(isPresented: $nextView, destination: {
                SignUpNicknameView()
                    .navigationBarHidden(true)
            })
            
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button() {
                        print("Back")
                        
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                }
            }
        }
    }
}

struct SignUpIsMajorView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpIsMajorView()
    }
}
