//
//  LoginSsafyView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/07/15.
//

import SwiftUI

struct SignUpCampusView: View {
//    @State var path: [StackViewType] = []
    
    @State private var campus: MenuOption? = nil
//    @State private var path = NavigationPath()
    @State var isLinkActive = false
    
    private var title: String = """
                                SSAFY\n캠퍼스를 선택해주세요
                                """
    var body: some View {
        NavigationStack() {
            ZStack {
                Color.background.edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        ProgressView("Loading...", value: 0.6, total: 1)
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
                            .frame(height: 33)
                        
                        
                        DropdownMenu(selectedOption: self.$campus, nextView: {
                            isLinkActive.toggle()
                        }, placeholder: "Select your campus", options: MenuOption.allCampus)
                        
                    
                        
                        Spacer()

                    }
            }
            
            .navigationDestination(isPresented: $isLinkActive) {
                SignUpIsMajorView()
                    .navigationBarHidden(true)
            }
            
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

struct LoginSsafyView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpCampusView()
    }
}
