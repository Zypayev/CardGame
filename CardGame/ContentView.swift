//
//  ContentView.swift
//  CardGame
//
//  Created by Ramazan Zypayev on 9/15/23.
//

import SwiftUI

struct ContentView: View {
    @State var cardCount: Int = 4
    let emojis = ["👻", "🎃", "😈", "👺", "🤡", "💩", "👽", "👹", "👾"]
    var body: some View {
        VStack {
            ScrollView{
                cards
            }
            Spacer()
            cardAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 140))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(emoji: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardAdjusters: some View {
        HStack {
            removeCardButton
            Spacer()
            addCardButton
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var removeCardButton: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var addCardButton: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    let emoji: String
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(emoji).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
