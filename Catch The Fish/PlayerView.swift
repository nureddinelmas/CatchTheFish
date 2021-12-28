//
//  PlayerView.swift
//  Catch The Fish
//
//  Created by Nureddin Elmas on 2021-12-28.
//


import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct PlayerView: View {
    @Binding var score : Int
    @Binding var isShowing : Bool
    @State var url = URL(string:"https://cdn.shopify.com/s/files/1/0584/3841/products/Kidrobot-South-Park-Angel-Kenny-8_2000x2000.gif?v=1610508275")

    @State var chosenX = 0.1
    @State var chosenY = 0.2
    
    
    @State var isChange = true
    
    @State var chosenStorX : Double = 0.1
    @State var chosenStorY : Double = 0.1
    
    var timer : Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            
            url = URL(string:"https://mir-s3-cdn-cf.behance.net/project_modules/disp/c54fb432873329.5696cb9548382.gif")
            self.chosenX = Double.random(in: 0.1...0.9)
            self.chosenY = Double.random(in: 0.1...0.85)
            
            self.chosenStorX = Double.random(in: 0.1...0.5)
            self.chosenStorY = Double.random(in: 0.1...0.4)
        }
    }
    var body: some View {
        if !isShowing {
//            WebImage(url: url )
                    Image("fish-2")
                     .resizable()
                     .scaledToFit()
                     .frame(width: UIScreen.main.bounds.width * self.chosenStorX, height: UIScreen.main.bounds.height * self.chosenStorY)
                     .position(x: UIScreen.main.bounds.width * chosenX, y: UIScreen.main.bounds.height * chosenY)
                     .onAppear {
                         if isChange {
                             _ = self.timer
                             isChange = false
                         }
                       
                     }
                     .onTapGesture {
                         self.score += 1
                         self.url = URL(string:"https://thumbs.gfycat.com/ShyEnlightenedCirriped.webp")
                     }
                    
        }
    }
}

struct TimerAndPlayerView_Previews: PreviewProvider {
    static var previews: some View {
       Text("hej")
    }
}
