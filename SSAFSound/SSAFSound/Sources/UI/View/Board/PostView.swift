//
//  PostView.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/19.
//

import SwiftUI

struct PostView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let preBoardName: String
    
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            NavigationStack{
                VStack{
                    BackButtonView(title: "\(preBoardName)", spacingWidth: UIScreen.screenWidth/3 - 10, backButtonAction: {
                        presentationMode.wrappedValue.dismiss()
                    }, showTitle: true)
                    
                    VStack{
                        ScrollView
                        {
                            PostContentItem()
                            Spacer().frame(height: 70)
                            PostCommentItem()
                            PostCommentItem()
                        }
                        Spacer()
                        PostTextInputItem()
                        Spacer()
                    }.padding(.horizontal,25)
                }
            }
            
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(preBoardName:"")
    }
}
