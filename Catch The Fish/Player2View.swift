//
//  Player2View.swift
//  Catch The Fish
//
//  Created by Nureddin Elmas on 2021-12-28.
//

import SwiftUI

struct Player2View: View {
    @Binding var score : Int
    @Binding var isShowing :Bool
    @State var chosenX : Double = 0.1
    @State var chosenY : Double = 0.1
    
    @State var isChange = true
    
    @State var chosenStorX : Double = 0.1
    @State var chosenStorY : Double = 0.1
    
    var timer : Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.chosenX = Double.random(in: 0.1...0.9)
            self.chosenY = Double.random(in: 0.1...0.85)
            
            self.chosenStorX = Double.random(in: 0.1...0.5)
            self.chosenStorY = Double.random(in: 0.1...0.4)
        }
    }
    var body: some View {
        if !isShowing {
            Image("fish3")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width * self.chosenStorX, height: UIScreen.main.bounds.height * self.chosenStorY, alignment: .center)
                .position(x: UIScreen.main.bounds.width * self.chosenX, y: UIScreen.main.bounds.height * self.chosenY)
                .onAppear(perform: {
                    if isChange {
                        _ = self.timer
                        isChange = false
                    }
                   
                    
                })
                .onTapGesture {
                    self.score += 1
                }
        }
       
    }
}

struct Player2View_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hej")
    }
}
