//
//  Animations.swift
//  WordScramble
//
//  Created by Jacquese Whitson on 7/13/23.
//

import SwiftUI

struct Animations: View {
    @State private var moved = CGSize.zero
    var body: some View {

        LinearGradient(colors: [.red,.yellow], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        // this is how far the drag moved so the card should do the samee
            .offset(moved)
        
            .gesture(
                DragGesture()
                // being passed in info abut the drag
                    .onChanged{moved = $0.translation}
                
                    .onEnded{
                        _ in moved = .zero
                    }
            )
            .animation(.spring(), value: moved)

            
        
        
        
        
        

    }
}

struct Animations_Previews: PreviewProvider {
    static var previews: some View {
        Animations()
    }
}
