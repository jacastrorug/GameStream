//
//  Home.swift
//  GameStream
//
//  Created by Julian Castro Ruge on 31/01/22.
//

import SwiftUI
import AVKit

struct Home: View {
    
    @State var selectedTab: Int = 2
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }.tag(0)
            
            GamesView()
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Games")
                }.tag(1)
            
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.tag(2)
            
            FavoritesView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }.tag(3)
            
        }
        .accentColor(.white)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
        
    }
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("tabBarColor"))
        
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        
        UITabBar.appearance().isTranslucent = true
        
    }
    
}

struct HomeView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("Marine")
                .ignoresSafeArea()
            
            VStack {
                
                Image("appLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                
                SubModuleHome()
                
                Spacer()
            }
            .padding(.horizontal, 18)
            
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }
    
}

struct SubModuleHome: View {
    
    @State var searchValue: String = ""
    @State var isGameInfoEmpty: Bool = false
    
    @ObservedObject var searchGame = SearchGame()
    @State var isGameViewActive: Bool = false
    
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    @State var isPlayerActive = false
    
    @State var gameSearched: Game!
    
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                HStack {
                    
                    Button(action: { watchGame(name: self.searchValue) },
                           label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(searchValue.isEmpty ? .yellow : Color("Dark-Cian"))
                    }).alert(isPresented: $isGameInfoEmpty) {
                        Alert(title: Text("Error"), message: Text("Game not found."), dismissButton: .default(Text("Ok")))
                    }
                    
                    ZStack(alignment: .leading) {
                        if searchValue.isEmpty {
                            Text("Search a video")
                                .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                        }
                        
                        TextField("", text: $searchValue)
                            .foregroundColor(.white)
                        
                    }
                    
                }
                .padding([.top, .leading, .bottom], 11)
                .background(Color("Blue-Gray"))
                .clipShape(Capsule())
                
                Text("MOST POPULAR")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                    .padding(.top)
                
                ZStack {
                    
                    Button(action: {self.watchGame(name: "The Witcher 3")}, label: {
                        
                        VStack(spacing: 0) {
                            
                            Image("TheWitcher3")
                                .resizable()
                                .scaledToFit()
                            
                            Text("The Witcher 3")
                                .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                                .background(Color("Blue-Gray"))
                            
                        }
                        
                    })
                    
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 42, height: 42)
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                .padding(.vertical)
                
                Text("CATEGORIES FOR YOU")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                    .padding(.top, 25)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        Button(action: {}, label: {
                            
                            ZStack {
                                
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color("Blue-Gray"))
                                    .frame(width: 160, height: 90)
                                
                                Image("FPS")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 42, height: 42)
                                
                            }
                            
                        })
                        
                        Button(action: {}, label: {
                            
                            ZStack {
                                
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color("Blue-Gray"))
                                    .frame(width: 160, height: 90)
                                
                                Image("RPG")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 42, height: 42)
                                
                            }
                            
                        })
                        
                        Button(action: {}, label: {
                            
                            ZStack {
                                
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color("Blue-Gray"))
                                    .frame(width: 160, height: 90)
                                
                                Image("OpenWorld")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 42, height: 42)
                                
                            }
                            
                        })
                        
                        
                    }
                    
                }
                
                Text("SUGGESTED FOR YOU")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                    .padding(.top, 25)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        Button(action: {self.watchGame(name: "Crash Bandicoot")},
                               label: {
                            
                            Image("Spiderman")
                                .resizable()
                                .frame(width: 240, height: 135)
                            
                        })
                        
                        Button(action: {self.watchGame(name: "Crash Bandicoot")},
                               label: {
                            
                            Image("BattleField6")
                                .resizable()
                                .frame(width: 240, height: 135)
                            
                        })
                        
                        Button(action: {self.watchGame(name: "Uncharted 4")},
                               label: {
                            
                            Image("Uncharted4")
                                .resizable()
                                .frame(width: 240, height: 135)
                            
                        })
                        
                        
                    }
                    
                }
                
                Text("YOU MIGHT LIKE")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                    .padding(.top, 25)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        Button(action: {self.watchGame(name: "Crash Bandicoot")},
                               label: {
                            
                            Image("TheLastOfUs")
                                .resizable()
                                .frame(width: 240, height: 135)
                            
                        })
                        
                        Button(action: {self.watchGame(name: "The Witcher 3")},
                               label: {
                            
                            Image("Uncharted4")
                                .resizable()
                                .frame(width: 240, height: 135)
                            
                        })
                        
                        
                    }
                    
                }
                
            }
        }
        
        if let game = gameSearched {
            NavigationLink(destination: GameView(game: game),
                           isActive: $isGameViewActive,
                           label: {EmptyView()})
        }
        
    }
    
    func playVideo(index: Int) {
        self.url = self.urlVideos[index]
        print("URL: \(self.url)")
        self.isPlayerActive = true
    }
    
    func watchGame(name: String) {
        
        searchGame.search(gameName: name)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            
            print("Number of elements: \(searchGame.gamesInfo.count)")
            
            if searchGame.gamesInfo.count > 0 {
                self.gameSearched = searchGame.gamesInfo[0]
                
                isGameViewActive = true
                
            } else {
                self.isGameInfoEmpty = true
            }
            
        }
        
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
