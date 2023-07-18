//
//  ButtonGroup.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/16.
//

import SwiftUI

struct InfoGroup: View{
    var body: some View{
        HStack(alignment: .center, spacing: 4){
            HStack(alignment: .center, spacing: 4){
                Image("thumbup")
                    .resizable()
                    .frame(width: 20,height: 17)
                    .aspectRatio(contentMode: .fit)
                Text("10")
                    .manropeFont(family: .Bold, size: 13)
                    .foregroundColor(.primaryDefault)
            }
            HStack(alignment: .center,spacing: 4){
                Image("review")
                    .resizable()
                    .frame(width: 20,height: 20)
                    .aspectRatio(contentMode: .fit)
                Text("10")
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
