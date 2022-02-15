//
//  GameView().swift
//  GameStream
//
//  Created by Julian Castro Ruge on 14/02/22.
//

import SwiftUI
import AVKit
import Kingfisher

struct GameView: View {
    var game: Game
    
    var body: some View {
        ZStack {
            Color("Marine")
                .ignoresSafeArea()
            
            VStack {
                
                GameVideo(url: self.game.videosUrls.mobile)
                    .frame(height: 300)
                
                
                ScrollView {
                    GameInfo(game: self.game)
                    GameGallery(game: self.game)
                    GameComments()
                    SimilarGames()
                    
                }.frame(maxHeight: .infinity)
                
            }
        }
    }
}

struct GameVideo: View {
    var url: String
    
    var body: some View {
        
        VideoPlayer(player: AVPlayer(url: URL(string: self.url)!))
            .ignoresSafeArea()
    }
}

struct GameInfo: View {
    var game: Game
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            Text("\(game.title)")
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding(.leading)
            
            HStack {
                
                Text("\(game.studio)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .padding(.leading)
                
                Text("\(game.contentRaiting)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                
                Text("\(game.publicationYear)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                
            }
            
            Text("\(game.description)")
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.top, 5)
                .padding(.leading)
            
            HStack {
                
                ForEach(game.tags, id: \.self) {tag in
                    
                    Text("#\(tag)")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(.top, 4)
                        .padding(.leading)
                    
                }
                
            }
            
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct GameGallery: View {
    var game: Game
    
    let gridShape = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("GALLERY")
                .foregroundColor(.white)
                .font(.title2)
                .padding(.leading)
                .padding(.top, 5)
            
            ScrollView(.horizontal) {
                
                LazyHGrid(rows: gridShape, spacing: 8) {
                    
                    ForEach(game.galleryImages, id: \.self) { imageUrl in
                        
                        ImageView(url: imageUrl)
                        
                    }
                    
                }
                
            }
            .frame(height: 180)
            .padding(.leading)
            
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}


struct GameComments: View {
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("COMMENTS")
                .foregroundColor(.white)
                .font(.title2)
                .padding(.leading)
                .padding(.top, 5)
            
            GameComment()
            GameComment()
            
        }.frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

struct GameComment: View  {
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 8)
                .fill(Color("Blue-Gray"))
            
            VStack(alignment: .leading) {
                HStack(spacing: 10) {
                    
                    Image("imageComments")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .cornerRadius(25)
                    
                    VStack(alignment: .leading) {
                        Text("Julian Castro")
                        .bold()
                        Text("7 days ago")
                    }
                }
                .padding(.bottom, 5)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac enim ultricies, blandit eros id, vestibulum augue. Vivamus et nisl sit amet mi consequat auctor. Suspendisse cursus lorem massa, eu gravida magna vehicula eget.")
                    
            }
            .foregroundColor(.white)
            .padding()
            
            
        }
        .frame(maxWidth: .infinity)
        .padding([.leading, .trailing], 10)
        
    }
    
}

struct SimilarGames: View {
    
    var games = [      "https://cdn.cloudflare.steamstatic.com/steam/apps/292030/ss_107600c1337accc09104f7a8aa7f275f23cad096.600x338.jpg",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/292030/ss_ed23139c916fdb9f6dd23b2a6a01d0fbd2dd1a4f.600x338.jpg",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/292030/ss_908485cbb1401b1ebf42e3d21a860ddc53517b08.600x338.jpg"
    ]
    
    let gridShape = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("SIMILAR GAMES")
                .foregroundColor(.white)
                .font(.title2)
                .padding(.leading)
                .padding(.top, 5)
            
            ScrollView(.horizontal) {
                
                LazyHGrid(rows: gridShape, spacing: 8) {
                    
                    ForEach(self.games, id: \.self) { imageUrl in
                        ImageView(url: imageUrl)
                    }
                    
                }
                
            }
            .frame(height: 180)
            .padding(.leading)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(game: Game(title: "The Witcher 3: Wild Hunt",
                            studio: "CD Project Red",
                            contentRaiting: "M",
                            publicationYear: "2015",
                            description: "As war rages on throughout the Northern Realms, you take on the greatest contract of your life — tracking down the Child of Prophecy, a living weapon that can alter the shape of the world.",
                            platforms: ["PC",
                                        "Playstation 4",
                                        "Xbox One"],
                            tags: ["RPG",
                                   "Action",
                                   "Open World"],
                            videosUrls: VideoUrl(mobile:"https://dl.dropboxusercontent.com/s/k6g0zwmsxt9qery/TheWitcher480.mp4",
                                        tablet: "https://dl.dropboxusercontent.com/s/9faic5dtebavp1o/TheWitcherMax.mp4"),
                            galleryImages: [      "https://cdn.cloudflare.steamstatic.com/steam/apps/292030/ss_107600c1337accc09104f7a8aa7f275f23cad096.600x338.jpg",
                                "https://cdn.cloudflare.steamstatic.com/steam/apps/292030/ss_ed23139c916fdb9f6dd23b2a6a01d0fbd2dd1a4f.600x338.jpg",
                                "https://cdn.cloudflare.steamstatic.com/steam/apps/292030/ss_908485cbb1401b1ebf42e3d21a860ddc53517b08.600x338.jpg"]
                           ))
    }
}
