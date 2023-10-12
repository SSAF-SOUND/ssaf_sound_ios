//
//  PortFolioLinkView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/09/20.
//

import SwiftUI

struct PortFolioLinkView: View {
    var title: String
    
    var body: some View {
        linkView()
    }
    
    @ViewBuilder
    private func linkView() -> some View {
        ZStack {
            HStack {
                Text(title)
                    .foregroundColor(.basicWhite)
                    .font(.pretendardBold14)
                    .padding(.vertical, 13)
                .padding(.horizontal, 20)
            }
            
        }
        .overlay {
            RoundedRectangle(cornerRadius: 40)
                .stroke(lineWidth: 2)
                .foregroundColor(.recruit)
        }
        .cornerRadius(40)
    
        
        
    }
}



struct PortFolioLinkView_Previews: PreviewProvider {
    static var previews: some View {
        PortFolioLinkView(title: "미입력")
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
