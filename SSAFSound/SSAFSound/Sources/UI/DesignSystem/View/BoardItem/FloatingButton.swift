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
                Image("write")
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 38, trailing: 25))
        }
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton()
    }
}
