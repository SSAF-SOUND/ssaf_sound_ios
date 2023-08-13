//
//  LoginButtonView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/08/14.
//

import SwiftUI

struct SignInButtonView: View {
    var image: ImageAsset
    var name: String
    var body: some View {
        Button {

        } label: {
            HStack {
                Image(asset: image)
                Text(name)
            }
            .padding(10.0)
            .overlay(
                RoundedRectangle(cornerRadius: 40.0)
                    .stroke(lineWidth: 1)
                    .frame(width: UIScreen.main.bounds.width.native - 40, height: 48)
            )
            
            .foregroundColor(Color.whilte)
        }
    }
}

struct SignInButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SignInButtonView(image: ImageAsset.login_google, name: "Google 로그인")
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
