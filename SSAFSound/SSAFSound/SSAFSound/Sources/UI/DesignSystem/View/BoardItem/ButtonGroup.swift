//
//  ButtonGroup.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/16.
//

import SwiftUI

struct ButtonGroup: View{
    var body: some View{
        HStack{
            Button {
                print("thumbsup")
            } label: {
                HStack(alignment: .center){
                    Image("thumbup")
                        .resizable()
                        .frame(width: 20,height: 20)
                        .aspectRatio(contentMode: .fit)
                    Text("n")
                    
                }.foregroundColor(.primaryDefault)
                    .manropeFont(family: .Bold, size: 13)
            }
            Button {
                print("review")
            } label: {
                HStack(alignment: .center){
                    Image("review")
                        .resizable()
                        .frame(width: 20,height: 20)
                        .aspectRatio(contentMode: .fit)
                    Text("n")
                    
                }.foregroundColor(.secondaryDefault)
                    .manropeFont(family: .Bold, size: 13)
            }
        }
        
    }
}


struct ButtonGroup_Previews: PreviewProvider {
    static var previews: some View {
        ButtonGroup()
    }
}
