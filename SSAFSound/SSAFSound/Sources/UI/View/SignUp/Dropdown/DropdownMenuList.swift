//
//  DropdownMenuList.swift
//  SSAFSound
//
//  Created by Subeen on 2023/07/15.
//

import SwiftUI

struct DropdownMenuList: View {
    /// The drop-down menu list options
    let options: [MenuOption]
    
    let onSelectedAction: (_ option: MenuOption) -> Void
    
    var nextView: () -> Void = {}
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 0) {
                ForEach(options) { option in
                    // Drop-down menu list row.
//                    DropdownMenuListRow(option: option, onSelectedAction: self.onSelectedAction)
                    DropdownMenuListRow(option: option, onSelectedAction: self.onSelectedAction, nextView: nextView)
                        
                }
            }
            
            
        }
        .onTapGesture {
            print("a")
        }
        .frame(height: CGFloat(self.options.count * 46) > 230
                ? 230
               : CGFloat(self.options.count * 46)
        )
//        .padding(.vertical, 5)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.ssafSoundColor(.grey), lineWidth: 1)
        }
    }
}

struct DropdownMenuList_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenuList(options: MenuOption.allCampus, onSelectedAction: { _ in })
    }
}
