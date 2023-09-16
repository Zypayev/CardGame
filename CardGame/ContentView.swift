//
//  ContentView.swift
//  CardGame
//
//  Created by Ramazan Zypayev on 9/15/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let emojis = ["👻", "🎃", "😈", "👺", "👺"]
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(emoji: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    let emoji: String
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(emoji).font(.largeTitle)
            } else {
                base
            }
        }
        .onTapGesture {
            isFaceUp.toggle()        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
