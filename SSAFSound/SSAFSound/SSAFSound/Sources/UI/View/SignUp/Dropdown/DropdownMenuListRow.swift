//
//  DropdownMenuListRow.swift
//  SSAFSound
//
//  Created by Subeen on 2023/07/15.
//

import SwiftUI

struct DropdownMenuListRow: View {
    let option: CampusMenuOption
    
    let onSelectedAction: (_ option: CampusMenuOption) -> Void
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .stroke()
                .frame(width: .infinity, height: 46)
                
            Button(action: {
                self.onSelectedAction(option)
                
            }) {
                Text(option.option)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .manropeFont(family: .Light, size: 16)
            }
            .frame(height: 26)
            .foregroundColor(Color.ssafSoundColor(.black))
            .padding(.vertical, 10)
            .padding(.horizontal, 40)
//            .background(Color.ssafSoundColor(.whilte))
            
            
        }
        
        
    }
}

struct DropdownMenuListRow_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenuListRow(option: CampusMenuOption.campus, onSelectedAction: { _ in })
    }
}
