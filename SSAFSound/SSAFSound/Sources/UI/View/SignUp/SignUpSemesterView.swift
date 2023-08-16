//
//  LoginSsafyView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/07/25.
//

import SwiftUI

struct SignUpSemesterView: View {
//    @State var path: [StackViewType] = []
    
    @State private var campus: MenuOption? = nil
//    @State private var path = NavigationPath()
    @State var isLinkActive = false
    
    
    private var title: String = """
                                SSAFY\n기수를 선택해주세요
                                """
    var body: some View {
        NavigationStack() {
            ZStack {
                Color.background.edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        ProgressView("Loading...", value: 0.4, total: 1)
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
                        }, placeholder: "Select your semester", options: MenuOption.allSemester)
                        
                        Spacer()

                    }
            }
            
            .navigationDestination(isPresented: $isLinkActive) {
                SignUpCampusView()
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

struct SignUpSemester_Previews: PreviewProvider {
    static var previews: some View {
        SignUpSemesterView()
    }
}
