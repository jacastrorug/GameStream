//
//  ContentView.swift
//  GameStream
//
//  Created by Julian Castro Ruge on 29/01/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            Color(red: 19.0/255, green: 30.0/255, blue: 53.0/255, opacity: 1.0)
                .ignoresSafeArea()
            
            VStack {
                
                Image("appLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                
                LoginAndRegisterView()
                
            }
            
        }
    }
}

struct LoginAndRegisterView: View {
    var body: some View {
        
        VStack {
            HStack {
                Text("SIGN IN")
                    .foregroundColor(.white)
                Text("REGISTER")
                    .foregroundColor(.white)
            }
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Image("pantalla01")
            .resizable()
            .aspectRatio(contentMode: .fit)
        ContentView()
    }
}
