//
//  PostTextInputItem.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/20.
//

import SwiftUI

struct PostTextInputItem: View {
    @State var sendMessage: String = ""
    @State var isAnomymous: Bool = false
    var body: some View {
        HStack{
            TextField("댓글을 입력해주세요", text: $sendMessage).lineLimit(5)
            Spacer()
            Button {
                print("anonymous toggle")
            } label: {
                Image(systemName: "checkmark.square")
            }
            Text("익명")
            Button {
                print("send")
            } label: {
                Image(systemName: "paperplane")
            }
            
        }
        .padding()
        .background(.white)
        .cornerRadius(20)
    }
}

struct PostTextInputItem_Previews: PreviewProvider {
    static var previews: some View {
        PostTextInputItem()
    }
}
