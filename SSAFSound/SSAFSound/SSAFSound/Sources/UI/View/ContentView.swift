//
//  ContentView.swift
//  SSAFSound
//
//  Created by Subeen on 2023/07/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.top)
            
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                    .manropeFont(family: .Bold, size: 20)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
