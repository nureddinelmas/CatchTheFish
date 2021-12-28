//
//  ContentView.swift
//  Catch The Fish
//
//  Created by Nureddin Elmas on 2021-12-28.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI


struct ContentView: View {
//    ikinci kez timer calisinca daha hizli oluyor.
    
    @State var titleOfGame = ""
    @State var score = 0
    @State var isAlertShowing = false
    @State var timeRemainig = 5.0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()


    var body: some View {
        ZStack{
            Image("ocean-1")
                .resizable()
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                .ignoresSafeArea()
            
//            RadialGradient(gradient: Gradient(colors: [Color.red, Color.blue, Color.brown, Color.green]), center: .center, startRadius: 5, endRadius: 600).ignoresSafeArea()
            PlayerView(score: $score, isShowing: $isAlertShowing)
            Player2View(score: $score, isShowing: $isAlertShowing)
           
        VStack{
            
            Text(titleOfGame)
                .font(.system(size: 40, weight: .semibold, design: .rounded)).padding()
            Spacer()
            Text("Time : \(String(format: "%.1f", timeRemainig))")
                .font(.system(size: 22, weight: .light, design: .rounded))
                .background(.conicGradient(colors: [Color.orange, Color.brown, Color.green], center: .center))
                .onReceive(timer) { _ in
                    if self.timeRemainig > 0 {
                        self.timeRemainig -= 1
                    }else{
                        isAlertShowing = true
                       titleOfGame = "Catch The Fish"
                     
                    }
                }
            Text("Score : \(self.score)")
                .font(.system(size: 25, weight: .light, design: .rounded))
                .background(.conicGradient(colors: [Color.green, Color.blue], center: .center))
            Spacer()
           
        }
        }.alert(isPresented: $isAlertShowing) {
            return Alert(title: Text("😊 Game Over 😊"), message: Text("You have \(score) score.😊 "), dismissButton: .default(Text("OK"), action: {
                timeRemainig = 5
                titleOfGame = ""
            }))
          
        }
        
    }
    
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
