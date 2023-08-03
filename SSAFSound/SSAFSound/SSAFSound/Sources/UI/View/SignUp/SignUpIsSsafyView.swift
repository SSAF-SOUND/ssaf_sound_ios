//
//  SignUpSsafyView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/07/16.
//

import SwiftUI

struct SignUpIsSsafyView: View {
    
//    @State var path: [StackViewType] = []
    
    private var title: String = """
                                안녕하세요\nSSAFY인 이신가요?
                                """
    
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.background.edgesIgnoringSafeArea(.all)
                
                VStack {
                    ProgressView("Loading...", value: 0.2, total: 1)
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
                            path.append("signUp")
                        } label: {
                            Rectangle()
                                                                .fill(Color.ssafSoundColor(.primaryDefault))
                                                                .frame(width: 160, height: 56)
                                                                .cornerRadius(8)
                                                                .overlay(Text("네"))
                                                                .foregroundColor(Color.ssafSoundColor(.black))
                        }
//                        NavigationLink(value: "signUp") {
//                            Button(action: {}) {
//                                Rectangle()
//                                    .fill(Color.ssafSoundColor(.primaryDefault))
//                                    .frame(width: 160, height: 56)
//                                    .cornerRadius(8)
//                                    .overlay(Text("네"))
//                                    .foregroundColor(Color.ssafSoundColor(.black))
//                            }
//                        }
                        
                        
                        NavigationLink(destination: SignUpCampusView()) {
                            Button(action: {}) {
                                Rectangle()
                                    .fill(Color.ssafSoundColor(.whilte))
                                    .frame(width: 160, height: 56)
                                    .cornerRadius(8)
                                    .overlay(Text("아니오"))
                                    .foregroundColor(Color.ssafSoundColor(.black))
                            }
                        }
                        
                        
                    }
                    Spacer()
                }
            }
            .navigationDestination(for: String.self) { view in
                if view == "signUp" {
                    SignUpCampusView()
                }
                    
            }
//            .navigationDestination(for: StackViewType.self) { stackViewType in
//                // ✅ 중요
//                switch stackViewType {
//                    case .campusView :
//                        SignUpCampusView()
//                    case .nicknameView:
//                        SignUpNicknameView()
//                    default :
//                        SignUpCampusView()  // 수정 필요
//                    }
//                }
            
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

struct SignUpSsafyView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpIsSsafyView()
    }
}
