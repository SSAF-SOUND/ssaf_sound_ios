//
//  DropdownMenu.swift
//  SSAFSound
//
//  Created by Subeen on 2023/07/15.
//

import SwiftUI

struct DropdownMenu: View {
    @State private var isOptionsPresented: Bool = false
    
    @Binding var selectedOption: CampusMenuOption?
    
    let placeholder: String
    let options: [CampusMenuOption]
    var body: some View {
        
        
        HStack {
            RoundedRectangle(cornerRadius: 8)
            .stroke(.gray, lineWidth: 2)
            .background(.white)
            .cornerRadius(8)
            .frame(height: 44)
            .overlay {
                HStack {
                    Text(selectedOption == nil ? placeholder : selectedOption!.option)
        //                    .fontWeight(.medium)
                        .foregroundColor(selectedOption == nil ? Color.ssafSoundColor(.grey) : Color.ssafySoundblack)
                    
                    Spacer()
                    
                    Image(systemName: self.isOptionsPresented ? "chevron.up" : "chevron.down")
                    // This modifier available for Image since iOS 16.0
                        .fontWeight(.medium)
                        .foregroundColor(Color.ssafySoundblack)
                }
                .padding(.horizontal, 20)
            }
            
            
            
        }
        .frame(width: UIScreen.main.bounds.width - 40, height: 44)
//        .background(.white)
        .onTapGesture {
            withAnimation {
                  self.isOptionsPresented.toggle()
             }
        }
        
        .padding(.horizontal, 10)
        
        
        
//        .background(.white)
        .overlay(alignment: .top) {
            VStack {
                if self.isOptionsPresented {
                    // 결과창과 선택창과의 간격
                    Spacer()
                        .frame(height: 60)
                    
                    // 버튼 눌렀을 때 생기는 리스트
                    DropdownMenuList(options: self.options) { option in
                        self.isOptionsPresented = false
                        self.selectedOption = option
                    }
                    .padding(.horizontal, 10)
                    
                    
                }
            }
        }
    }
}

struct DropdownMenu_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenu(
            selectedOption: .constant(nil),
            placeholder: "Select your campus",
            options: CampusMenuOption.allCampus)
    }
}
