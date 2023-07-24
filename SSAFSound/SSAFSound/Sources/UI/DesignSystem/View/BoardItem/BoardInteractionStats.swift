//
//  ButtonGroup.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/16.
//

import SwiftUI

struct BoardInteractionStats: View{
    var body: some View{
        HStack(alignment: .center, spacing: 4){
            HStack(alignment: .center, spacing: 4){
                Image(asset: .thumb)
                    .resizable()
                    .frame(width: 20,height: 20)
                    .aspectRatio(contentMode: .fit)
                    .colorMultiply(.primaryDefault)
                    .padding(.bottom,3)
                Text("10")
                    .manropeFont(family: .Bold, size: 13)
                    .foregroundColor(.primaryDefault)
            }
            HStack(alignment: .center,spacing: 4){
                Image(asset: .message)
                    .resizable()
                    .frame(width: 20,height: 20)
                    .aspectRatio(contentMode: .fit)
                    .colorMultiply(.secondaryDefault)
                Text("10")
                    .manropeFont(family: .Bold, size: 13)
                    .foregroundColor(.secondaryDefault)
            }
        }
        
    }
}

struct BoardInteractionStats_Previews: PreviewProvider {
    static var previews: some View {
        BoardInteractionStats()
    }
}
