//
//  GameStreamApp.swift
//  GameStream
//
//  Created by Julian Castro Ruge on 29/01/22.
//

import SwiftUI

@main
struct GameStreamApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase, perform: { phase in
            // When the app change the state (active, inactive or background) this will be executed
            
            print(phase)
            
            if phase == .inactive {
                print("The apps is inactive, consider save the data")
            }
            
            
        })
    }
}
