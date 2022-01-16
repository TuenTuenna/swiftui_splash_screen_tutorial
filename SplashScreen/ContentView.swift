//
//  ContentView.swift
//  SplashScreen
//
//  Created by Jeff Jeong on 2022/01/16.
//

import SwiftUI

struct ContentView: View {
    
    @State var isContentReady : Bool = false
    
    var body: some View {
        
        ZStack{
            
            Text("Hello, world!")
                .padding()
            
            if !isContentReady {
                
                LottieView(jsonName: "three_circles")
                    .background(Color.white.edgesIgnoringSafeArea(.all))
                    .transition(.opacity)
                
//                LottieView()
//                    .background(Color.white.edgesIgnoringSafeArea(.all))
//                    .transition(.opacity)
                
//                mySplashScreenView.transition(.opacity)
            }
        }
        .onAppear{
            print("ContentView - onAppear() called")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                print("ContentView - 1.5초 뒤")
                withAnimation{isContentReady.toggle()}
            })
        }
    }
}

//MARK: - 스플래시 스크린
extension ContentView {
    var mySplashScreenView: some View {
        Color.yellow.edgesIgnoringSafeArea(.all)
            .overlay(alignment: .center){
                Text("스플래시 입니다!")
                    .font(.largeTitle)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
