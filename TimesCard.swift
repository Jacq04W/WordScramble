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
    var body: some View {
        ZStack{
            if cardShowing == .front {
                LinearGradient(colors: [.purple,.indigo], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .frame(width: 160, height: 160)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
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
            else {
                LinearGradient(colors: [.purple,.indigo], startPoint: .topTrailing, endPoint: .bottomLeading)
                    .frame(width: 160, height: 160)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("\(value * multiple)")
                    .font(.system(size: 34, weight: .bold, design: .monospaced))
                    .foregroundStyle( LinearGradient(colors: [.green,.green], startPoint: .topTrailing, endPoint: .bottomLeading))
                    .transition(.scale)
                
            }
        }
        .animation(.easeInOut)

        .onTapGesture(count: 2) {
            withAnimation(.easeInOut(duration: 0.6)){
                if cardShowing == .front{
                    cardShowing = .back
                }
                
                else if  cardShowing == .back{
                    cardShowing = .front
                }
            }
        }
    }
}

struct TimesCard_Previews: PreviewProvider {
    static var previews: some View {
        TimesCard()
    }
}
