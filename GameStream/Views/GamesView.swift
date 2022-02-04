//
//  GamesView.swift
//  GameStream
//
//  Created by Julian Castro Ruge on 1/02/22.
//

import SwiftUI
import Kingfisher

struct GamesView: View {
    
    @ObservedObject var videoGamesList = ViewModel()
    
    @State var gameViewIsActive: Bool = false
    @State var url: String = ""
    @State var title: String = ""
    @State var studio: String = ""
    @State var contentRating: String = ""
    @State var publicationYear: String = ""
    @State var description: String = ""
    @State var tags: [String] = [""]
    @State var imgsUrl: [String] = [""]
    
    let gridShape = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack{
            
            Color("Marine")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Games")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 64, trailing: 0))
                
                ScrollView {
                    
                    LazyVGrid(columns: gridShape, spacing: 8) {
                        
                        ForEach(videoGamesList.gamesInfo, id: \.self) { game in
                            
                            Button(action: {selectGame(game: game)}, label: {
                                
                                if #available(iOS 15.0, *) {
                                    
                                    AsyncImage(url: URL(string: game.galleryImages[0])) { phase in
                                        
                                        if let image = phase.image {
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                                .padding(.bottom, 12)
                                        } else if phase.error != nil {
                                            Image(systemName: "exclamationmark.icloud")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 100, height: 100)
                                                .foregroundColor(.gray)
                                        } else {
                                            Image(systemName: "gamecontroller")
                                                .renderingMode(.template)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 100, height: 100)
                                                .foregroundColor(.gray)
                                        }
                                        
                                    }
                                    
                                    
                                } else {
                                    
                                    KFImage(URL(string: game.galleryImages[0])!)
                                        .resizable()
                                        .aspectRatio( contentMode: .fit)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .padding(.bottom, 12)
                                    
                                }
                                
                            })
                            
                        }
                        
                    }
                    
                }
                
            }.padding(.horizontal, 6)
            
        }
        .navigationBarHidden(true)
    }
    
    func selectGame(game: Game) {
        self.url = game.videosUrls.mobile
        self.title = game.title
        self.studio = game.studio
        self.contentRating = game.contentRaiting
        self.publicationYear = game.publicationYear
        self.description = game.description
        self.tags = game.tags
        self.imgsUrl = game.galleryImages
        
        print("Game selected: \(self.title)")
        
    }
    
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
