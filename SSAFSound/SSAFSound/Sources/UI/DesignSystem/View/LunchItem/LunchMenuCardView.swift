//
//  LunchMenuCardView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/09/04.
//

import SwiftUI

struct LunchMenuCardView: View {
    @State var isSelected: Bool
    @State var count: Int
    
    var body: some View {
        ZStack {
            Color.primarySub
            HStack(spacing: 0) {
    
                Image(asset: .track_fallback_primary)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .border(.white)
                    
                    .clipped()
                    .frame(width: .infinity, height: .infinity, alignment: .leading)
                    
                ZStack {
                    if isSelected {
                        Color.primaryPoint
                    } else {
                        Color.basicWhite
                    }
                    VStack {
                        Image(asset: .thumb_fill_2)
                            .resizable()
                            .frame(width: 36, height: 36)
                        Text("\(count)")
                            .font(.pretendardBold20)
                    }
                    .foregroundColor(isSelected ? .basicWhite : .basicBlack)
                    
                }
                .frame(width: 120, height: 380)
                .onTapGesture {
                    isSelected.toggle()
                }
            }
            

            HStack {
                VStack(alignment: .leading) {
                    Spacer()
                        .frame(height: 90)
//                    Rectangle()
//                        .foregroundColor(.secondaryPoint)
//                        .frame(width: 200, height: 100)
//                    .rotationEffect(Angle(degrees: 315))
//                    Spacer()
                    Text("한식코너")
                        .font(.pretendardBold16)
                    Text("돼지갈비")
                        .font(.pretendardBold24)
                }
                .padding(.leading, 20)
                .foregroundColor(.basicWhite)
                Spacer()
            }
            

        }
        .frame(height: 182)
        .frame(maxWidth: 380)
        .padding(0)
        .cornerRadius(20)
        .foregroundColor(.primaryDefault)
    }
}

struct LunchMenuCardView_Previews: PreviewProvider {
    static var previews: some View {
        LunchMenuCardView(isSelected: true, count: 134)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
