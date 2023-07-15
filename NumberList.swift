//
//  NumberList.swift
//  WordScramble
//
//  Created by Jacquese Whitson on 7/14/23.
//

import SwiftUI

struct NumberList: View {
    @State var num : Int
    var body: some View {
        VStack(alignment: .leading){
            Text("x\(num)")
                .font(.title)
                .bold()
                .lineLimit(1)
                .foregroundColor(.black)
//            .padding(.trailing,300)
            
        }
        
        .frame(maxWidth: .infinity)
        .background(
        LinearGradient(colors: [.purple,.orange], startPoint: .bottom, endPoint: .topTrailing)
            .frame( maxWidth: .infinity)
            .frame(height: 30)
            .clipShape(RoundedRectangle(cornerRadius: 10)))
//        .overlay(
//            RoundedRectangle(cornerRadius: 20)
//                .frame( maxWidth: .infinity)
//
        
//        )
        
            
    }
}

struct NumberList_Previews: PreviewProvider {
    static var previews: some View {
        NumberList(num: 10)
    }
}
