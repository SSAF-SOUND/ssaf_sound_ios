//
//  LoginView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/08/13.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea(.all)
            
            
            
            VStack {
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
                
                Spacer()
                    .frame(height: 140)
                
                
                VStack(spacing: 18){
                    SignInButtonView(image: .login_google, name: "Google 로그인")
                    SignInButtonView(image: .login_github, name: "GitHub 로그인")
                    SignInButtonView(image: .login_kakao, name: "Kakao 로그인")
                    SignInButtonView(image: .login_apple, name: "Apple 로그인")
                }
                
                Spacer()
                    .frame(height: 29)
                
                Text("SKIP")
                    .foregroundColor(Color.whilte)
                
                Spacer()
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
