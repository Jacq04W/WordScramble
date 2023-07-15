//
//  TimesTableView.swift
//  WordScramble
//
//  Created by Jacquese Whitson on 7/14/23.
//

import SwiftUI

struct TimesTableView: View {
    @State var value: Int = 0
    @State var questionCount = QuestionCount.five
    // this is to hold the current value to show
    @State var chosenAmount = 16
    let columns: [GridItem] = [
        GridItem(.flexible(),spacing: 6,alignment: .trailing),
        GridItem(.flexible(),spacing: 6,alignment: .leading),

    ]
var body: some View {
    ScrollView(.vertical) {
        ZStack {
            
            LinearGradient(colors: [Color.cyan.opacity(0.7), Color.purple.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)

            Circle()
                .frame(width: 300)
                .foregroundColor(Color.blue.opacity(0.3))
                .blur(radius: 10)
                .offset(x: -100, y: -150)

            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .frame(width: 500, height: 500)
                .foregroundStyle(LinearGradient(colors: [Color.purple.opacity(0.6), Color.mint.opacity(0.5)], startPoint: .top, endPoint: .leading))
                .offset(x: 300)
                .blur(radius: 30)
                .rotationEffect(.degrees(30))

            Circle()
                .frame(width: 450)
                .foregroundStyle(Color.pink.opacity(0.6))
                .blur(radius: 20)
                .offset(x: 200, y: -200)
            VStack{
                
                VStack {
                    ForEach(0..<6){ i in
                        Spacer()
                    }
//

                    HStack{
                        ForEach(QuestionCount.allCases,id: \.self){
                            num in
                        
                            Button{
                                chooseAmount(amount: num)
                            }
                            
                        label:{
                            topCards(num:num)
                        }
                            
                        }
                       
                    }
                }
                .padding()
                /// Grid
                LazyVGrid(columns: columns, alignment: .center, spacing: 4, pinnedViews: []){
                    ForEach(2..<chosenAmount,id: \.hashValue){  num in
                                    
                        TimesCard(value: value,multiple: num)
                        
                        
                    }
                }
            
            }
        }
    }
    .ignoresSafeArea()
    




    }
    
    
    
    
    
    
    
    
    func topCards(num:QuestionCount) -> some View {
        ZStack{
      
        LinearGradient(colors: [.red,.yellow], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 120, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        Text("\(num.rawValue)")
            .font(.system(size: 30))
            .bold()
            .foregroundColor(.black)
        }
    }

    func chooseAmount(amount:QuestionCount){
        switch amount {
        case .five:
            chosenAmount = 6
    print("")
        case.ten:
            chosenAmount = 11

            print("")

        case .fifteen:
            chosenAmount = 16

            print("")

        }
        }

}

struct TimesTableView_Previews: PreviewProvider {
    static var previews: some View {
        TimesTableView (value: 4)
    }
}

