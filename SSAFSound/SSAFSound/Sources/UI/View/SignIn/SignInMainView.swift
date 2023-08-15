//
//  SignInMainView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/08/13.
//

import SwiftUI

struct SignInMainView: View {
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea(.all)
            
            VStack(alignment: .leading) {
                Spacer()
                
                Image(asset: .sign_in_character)
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, alignment: .center)
                
                Spacer()
                    .frame(height: 18)
                
                Image(asset: .logo)
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, alignment: .center)
                
                Text("에 오신 것을 환영합니다!")
                    .foregroundColor(Color.whilte)
                
                Spacer()
            }
        }
    }
}

struct SignInMainView_Previews: PreviewProvider {
    static var previews: some View {
        SignInMainView()
    }
}
