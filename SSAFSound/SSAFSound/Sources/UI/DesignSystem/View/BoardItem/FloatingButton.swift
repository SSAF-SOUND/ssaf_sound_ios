//
//  FloatingButton.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/17.
//

import SwiftUI

struct FloatingButton: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            Color.clear
            Spacer()
            Button {
                print("Hello")
            } label: {
               Circle()
                    .fill(Color.primaryDefault)
                    .frame(width: 43, height: 43)
                    .overlay {
                        Image(asset: .pencil)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 38, trailing: 25))
        }
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton()
    }
}
