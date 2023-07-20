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
                Image("great")
                    .resizable()
                    .frame(width: 20,height: 17)
                    .aspectRatio(contentMode: .fit)
                    .colorMultiply(.primaryDefault)
                Text("10")
                    .manropeFont(family: .Bold, size: 13)
                    .foregroundColor(.primaryDefault)
            }
            HStack(alignment: .center,spacing: 4){
                Image("messageOutline")
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

struct InfoGroup2: View{
    var body: some View{
        HStack(alignment: .center, spacing: 7){
            HStack(alignment: .center, spacing: 7){
                Image("great")
                    .resizable()
                    .frame(width: 20,height: 20)
                    .aspectRatio(contentMode: .fit)
                    .colorMultiply(.primaryDefault)
                Text("10")
                    .manropeFont(family: .Bold, size: 13)
                    .foregroundColor(.primaryDefault)
            }
            HStack(alignment: .center,spacing: 7){
                Image("BookMark")
                    .resizable()
                    .frame(width: 16,height: 20)
                    .aspectRatio(contentMode: .fit)
                    .colorMultiply(.primaryDefault)
                Text("10")
                    .manropeFont(family: .Bold, size: 13)
                    .foregroundColor(.primaryDefault)
            }
            Spacer()
            HStack(alignment: .center,spacing: 7){
                Image("messageOutline")
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


struct InfoGroup_Previews: PreviewProvider {
    static var previews: some View {
        InfoGroup2()
    }
}
