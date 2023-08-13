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
    
//    @State private var path = NavigationPath()
    @State private var nextView: Bool = false
    
    var body: some View {
        NavigationStack() {
            ZStack {
                Color.background.edgesIgnoringSafeArea(.all)
                
                VStack {
                    ProgressView("Loading...", value: 0.2, total: 1)
                        .progressViewStyle(CustomProgressBar())
                    
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
//                            path.append("semester")
                        } label: {
                            Rectangle()
                                .fill(Color.ssafSoundColor(.primaryDefault))
                                .frame(width: 160, height: 56)
                                .cornerRadius(8)
                                .overlay(Text("네"))
                                .foregroundColor(Color.ssafySoundblack)
                        }

                        
                        NavigationLink(destination: SignUpCampusView()) {
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
                SignUpSemesterView()
                    .navigationBarHidden(true)
            })
            

            
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button() {
                        print("Back")
                        
                    } label: {
                        Image(asset: .arrow_narrow_left)
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
