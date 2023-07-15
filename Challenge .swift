//
//  Challenge .swift
//  WordScramble
//
//  Created by Jacquese Whitson on 7/14/23.
//

import SwiftUI


enum QuestionCount: Int,CaseIterable{
    case five = 5
    case ten = 10
    case fifteen = 15
}

struct Challenge_: View {
    
    enum State{
        case settings
        case playing
    }
    
   

    var body: some View { 
        NavigationView {
            VStack{
                Text("Wasup Tink 💕")
                    .bold()
                    .foregroundColor(.pink)
        Text("Choose what you want to practice")
                    .font(.system(size: 30, weight: .heavy, design: .monospaced))    .multilineTextAlignment(.center)
                Spacer()
                timesList
                Spacer()
                Spacer()

            }
        }
    }
}

struct Challenge__Previews: PreviewProvider {
    static var previews: some View {
        Challenge_()
    }
}

private extension Challenge_ {
    var timesList : some View  {
        VStack{
            ForEach(2..<13){num in
                NavigationLink{
                    withAnimation{
                        TimesTableView(value: num)
                            .transition(.move(edge: .bottom))
                    }
                }label:{
                    NumberList(num: num)
                    
                }
            }
        }
    }
    
    
}
