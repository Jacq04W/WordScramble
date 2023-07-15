//
//  TimesCard.swift
//  WordScramble
//
//  Created by Jacquese Whitson on 7/14/23.
//

import SwiftUI
enum CardShowing{
    case front, back
}
struct TimesCard: View {
    @State  var value: Int = 12
    @State  var multiple: Int = 10
    @State var cardShowing = CardShowing.front
    let frontColor =    LinearGradient(colors: [.purple,.indigo], startPoint: .topLeading, endPoint: .bottomTrailing)
    let backColor =
    LinearGradient(colors: [.purple,.indigo], startPoint: .topTrailing, endPoint: .bottomLeading)

    let shape = RoundedRectangle(cornerRadius: 20)
    var body: some View {
        ZStack{
            if cardShowing == .front {
                frontColor
                    .frame(width: 160, height: 160)
                    .clipShape(shape)
                frontWords
            }
            else {
                backColor
                    .frame(width: 160, height: 160)
                    .clipShape(shape)
                backWords
            }
        }
        .animation(.easeInOut)

        .onTapGesture(count: 2) {
            withAnimation(.easeInOut(duration: 0.6)){
               cardflip()
            }
        }
    }
}

struct TimesCard_Previews: PreviewProvider {
    static var previews: some View {
        TimesCard()
    }
}

private extension TimesCard {
    // new code ⚡️
    var frontWords : some View  {
        VStack(spacing: 10){
            Text("What is")
                .font(.system(size: 25, weight: .bold, design: .monospaced))
                .foregroundColor(.black)
            Text("\(value) X \(multiple)")
                .font(.system(size: 34, weight: .bold, design: .monospaced))
                .foregroundStyle( LinearGradient(colors: [.green,.green], startPoint: .topTrailing, endPoint: .bottomLeading))
                .transition(.scale)
            
        }
        .padding(.bottom,20)
    }

    // new code ⚡️
    var backWords : some View {
        VStack{
            Text("\(value * multiple)")
                .font(.system(size: 34, weight: .bold, design: .monospaced))
                .foregroundStyle( LinearGradient(colors: [.green,.green], startPoint: .topTrailing, endPoint: .bottomLeading))
                .transition(.scale)
        }
    }

    // new code ⚡️
    func cardflip(){
        if cardShowing == .front{
            cardShowing = .back
        }
        
        else if  cardShowing == .back{
            cardShowing = .front
        }
    }

}
