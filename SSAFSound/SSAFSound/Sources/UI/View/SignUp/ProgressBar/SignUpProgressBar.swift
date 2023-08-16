//
//  SignUpProgressBar.swift
//  SSAFSound
//
//  Created by Subeen on 2023/07/16.
//

import SwiftUI

struct SignUpProgressBar: View {
    
    var body: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
            ProgressView("Loading...", value: 0.5, total: 1)
                    .progressViewStyle(CustomProgressBar())
            
        }
        
    }
}

struct CustomProgressBar: ProgressViewStyle {
    @State private var gauge: Int = 0
    private var width: CGFloat = CGFloat(Int(UIScreen.main.bounds.width - 52))
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
//            Text("\(Int(configuration.fractionCompleted ?? 0.0 * 100))%")
            ZStack(alignment: .leading) {
                Rectangle().frame(width: width, height: 5)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                Rectangle().frame(width: width * CGFloat(configuration.fractionCompleted ?? 0.0), height: 5)
                    .foregroundColor(Color.ssafSoundColor(.primaryDefault))
                    .cornerRadius(10)
            }
            
        }
    }
}

struct SignUpProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        SignUpProgressBar()
    }
}
