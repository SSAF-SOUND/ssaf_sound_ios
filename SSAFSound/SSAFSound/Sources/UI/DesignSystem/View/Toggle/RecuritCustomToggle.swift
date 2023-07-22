//
//  RecuritCustomToggle.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/07/18.
//

import SwiftUI

public struct RecuritCustomToggle: ToggleStyle {
    var activeColor: Color = Color.gray
    var activeCircle: Bool
    var height: CGFloat
    var width: CGFloat

    public init(activeColor: Color, activeCircle: Bool, height: CGFloat, width: CGFloat) {
        self.activeColor = activeColor
        self.activeCircle = activeCircle
        self.width = width
        self.height = height
    }

    //MARK: -  컴스텀으로 toggle 만드는 UI
    public func makeBody(configuration: Configuration) -> some View {
        RoundedRectangle(cornerRadius: 30)
            .stroke(configuration.isOn ? activeColor : Color.gray, style: .init(lineWidth: 2))
//                .fill(configuration.isOn ? activeColor : Color.gray4)
            .frame(width: width, height: height)
//                .background(configuration.isOn ? activeColor : Color.gray)
            .cornerRadius(30)
            .overlay {
                
                HStack {
                    Text("모집중")
                        .manropeFont(family: .Bold , size: 18)
                        .kerning(-0.3)
                        .offset(x: configuration.isOn ? 8 : 25)
                        .foregroundColor(configuration.isOn ? activeColor: .bluegrey)
                    
                    Circle()
                        .fill(activeCircle ? activeColor : .grey)
                        .frame(width: 20, height: 20)
                        .padding(3)
                        .offset(x: configuration.isOn ? 8 : -60)
                }

            }
           
            .onTapGesture {
                withAnimation(.spring()) {
                    configuration.isOn.toggle()
                }
            }
    }

}



public struct RecuritCustomToggle_Previews: PreviewProvider {
    public static var previews: some View {
        HStack {
            Toggle("모집중", isOn: .constant(false))
                .toggleStyle(RecuritCustomToggle(activeColor: Color.primaryDefault, activeCircle: true, height: 40, width: 100))
        }
    }
}
