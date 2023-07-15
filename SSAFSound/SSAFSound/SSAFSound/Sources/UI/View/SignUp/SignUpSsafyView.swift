//
//  LoginSsafyView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/07/15.
//

import SwiftUI

struct SignUpSsafyView: View {
    @State private var campus: CampusMenuOption? = nil
    var body: some View {
        NavigationView {
            DropdownMenu(selectedOption: self.$campus, placeholder: "Select your campus", options: CampusMenuOption.allCampus)
            
        }.background(Color.ssafSoundColor(.background))
        
        
    }
    
}

struct LoginSsafyView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpSsafyView()
    }
}
