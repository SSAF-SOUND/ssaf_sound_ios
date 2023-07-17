//
//  ButtonGroup.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/16.
//

import SwiftUI

struct InfoGroup: View{
    var body: some View{
        HStack{
            HStack(alignment: .center){
                Image("thumbup")
                    .resizable()
                    .frame(width: 20,height: 20)
                    .aspectRatio(contentMode: .fit)
                Text("n")
                    .manropeFont(family: .Bold, size: 13)
                    .foregroundColor(.primaryDefault)
            }
            HStack(alignment: .center){
                Image("review")
                    .resizable()
                    .frame(width: 20,height: 20)
                    .aspectRatio(contentMode: .fit)
                Text("n")
                    .manropeFont(family: .Bold, size: 13)
                    .foregroundColor(.secondaryDefault)
            }
        }
        
    }
}


struct InfoGroup_Previews: PreviewProvider {
    static var previews: some View {
        InfoGroup()
    }
}
