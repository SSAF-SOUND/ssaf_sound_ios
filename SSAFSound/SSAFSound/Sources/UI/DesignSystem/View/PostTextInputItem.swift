//
//  PostTextInputItem.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/20.
//

import SwiftUI

struct PostTextInputItem: View {
    @State var sendMessage: String = ""
    @State var isAnomymous: Bool = true
    var body: some View {
        HStack{
            TextField("댓글을 입력해주세요", text: $sendMessage, axis: .vertical)
                .lineLimit(3)
            
            Spacer()
            Button {
                print("anonymous toggle")
                isAnomymous.toggle()
            } label: {
                HStack(alignment: .center, spacing: 5){
                    Image(systemName: isAnomymous ? "checkmark.square" : "square")
                    Text("익명")
                        .manropeFont(family: .Bold, size: 14)
                        .foregroundColor(.ssafySoundblack)
                }
            }
            .padding(.trailing, 8)
            
            Button {
                print("send")
            } label: {
                Image(systemName: "paperplane")
            }
            
        }
        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
        .background(.white)
        .cornerRadius(20)
    }
}

struct PostTextInputItem_Previews: PreviewProvider {
    static var previews: some View {
        PostTextInputItem()
    }
}
