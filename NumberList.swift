//
//  NumberList.swift
//  WordScramble
//
//  Created by Jacquese Whitson on 7/14/23.
//

import SwiftUI

struct NumberList: View {
    let backgroundColor =         LinearGradient(colors: [.purple,.orange], startPoint: .bottom, endPoint: .topTrailing)
    @State var num : Int
    var body: some View {
        showNumber
            
    }
}

struct NumberList_Previews: PreviewProvider {
    static var previews: some View {
        NumberList(num: 10)
    }
}





private extension NumberList{
    var showNumber : some View  {
        VStack(alignment: .leading){
            Text("x\(num)")
                .font(.title)
                .bold()
                .lineLimit(1)
                .foregroundColor(.black)
            
        }
        
        .frame(maxWidth: .infinity)
        .background(
            backgroundColor
            .frame( maxWidth: .infinity)
            .frame(height: 30)
        .clipShape(RoundedRectangle(cornerRadius: 10)))
    }


}
