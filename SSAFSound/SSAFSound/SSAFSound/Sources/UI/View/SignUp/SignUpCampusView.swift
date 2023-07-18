//
//  LoginSsafyView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/07/15.
//

import SwiftUI

struct SignUpCampusView: View {
    @State private var campus: CampusMenuOption? = nil
    var body: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("")
                
                DropdownMenu(selectedOption: self.$campus, placeholder: "Select your campus", options: CampusMenuOption.allCampus)
                    

                
            }
        }
    }
    
}

struct LoginSsafyView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpCampusView()
    }
}
