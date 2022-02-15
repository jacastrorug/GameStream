//
//  FavoritesView.swift
//  GameStream
//
//  Created by Julian Castro Ruge on 15/02/22.
//

import SwiftUI
import AVKit

struct FavoritesView: View {
    
    @ObservedObject var allVideoGames = ViewModel()
    
    var body: some View {
        
        ZStack {
            Color("Marine")
                .ignoresSafeArea()
            
            VStack {
                
                Text("FAVORITES")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 9)
                
                ScrollView {
                    
                    ForEach(allVideoGames.gamesInfo, id: \.self) { game in
                        
                        VStack(spacing: 0) {
                            VideoPlayer(player: AVPlayer(url: URL(string: game.videosUrls.mobile)!))
                                .frame(height: 300)
                            
                            Text("\(game.title)")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color("Blue-Gray"))
                                .clipShape(RoundedRectangle(cornerRadius: 3))
                                
                        }.padding(.bottom, 9)
                        
                    }
                    
                    
                }.padding(.bottom, 8)
                
                
            }.padding(.horizontal, 6)
            
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
