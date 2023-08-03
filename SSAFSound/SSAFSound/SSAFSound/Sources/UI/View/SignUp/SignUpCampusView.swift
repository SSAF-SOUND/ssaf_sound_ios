//
//  LoginSsafyView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/07/15.
//

import SwiftUI

struct SignUpCampusView: View {
//    @State var path: [StackViewType] = []
    
    @State private var campus: CampusMenuOption? = nil
    @State private var path = NavigationPath()
    @State var isLinkActive = false
    
    private var title: String = """
                                SSAFY\n캠퍼스를 선택해주세요
                                """
    var body: some View {
        NavigationStack(path: $path) {
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
                        
                        DropdownMenu(selectedOption: self.$campus, placeholder: "Select your campus", options: CampusMenuOption.allCampus)
                            .onTapGesture {
                                path.append("isMajor")
                                isLinkActive = true
                            }
                        
                        Spacer()

                    }
            }
            
            .navigationDestination(isPresented: $isLinkActive) {
                SignUpIsMajorView()
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
