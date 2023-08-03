//
//  PostContentItem.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/19.
//

import SwiftUI

struct PostContentItem: View {
    @State private var isEdit: Bool = true
    
    let tempTitle:String = "제목이 들어갈위치입니다. 제목이 들어갈위치입니다. 제목이 들어갈위치입니다. 제목이 들어갈위치입니다.제목이 들어갈위치입니다.  "
    
    var body: some View {
        ZStack{
            Color.grey
            VStack(alignment: .leading,spacing: 11){
                HStack(alignment: .center){
                    // MARK: 닉네임 앞자 아이콘 넣을자리
                    Spacer().frame(width: 20,height: 20)
                    Text("NickName000")
                        .manropeFont(family: .Bold, size: 18)
                        .foregroundColor(.white)
                    Image("track_fallback_primary")
                        .resizable()
                        .frame(width: 10,height: 15)
                        .padding(.trailing,10)
                    // MARK: 작성일(편집일) | 시간
                    Text("00-00 | 00:00")
                        .manropeFont(family: .Regular, size: 12)
                        .foregroundColor(.white)
                    Spacer()
                    if isEdit {
                        Text("(수정됨)")
                            .manropeFont(family: .Bold, size: 12)
                            .foregroundColor(.primaryPoint)
                    }
                    
                }
                
                Text(tempTitle)
                    .manropeFont(family: .Bold, size: 16)
                    .foregroundColor(.white)

                Text("내용 들어갈 위치")
                    .manropeFont(family: .Bold, size: 13)
                    .foregroundColor(.white)
                    .padding(.bottom,30)
                PostInteractionStats()
                
                
                
                
            }.padding()
        }.frame(minHeight: 169)
        
    }
}

struct PostContentItem_Previews: PreviewProvider {
    static var previews: some View {
        PostContentItem()
    }
}
