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
            
            VStack {
                Text("Profile")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                Image(systemName: "person")
            }.tabItem {
                Image(systemName: "person")
                Text("Profile")
            }.tag(0)
            
            Text("Games")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Games")
                }.tag(1)
            
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.tag(2)
            
            Text("Favorites")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }.tag(3)
            
        }.accentColor(.white)
        
    }
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("tabBarColor"))
        
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        
        UITabBar.appearance().isTranslucent = true
        
    }
    
}

struct HomeView: View {
    
    @State var searchValue: String = ""
    
    var body: some View {
        
        ZStack {
            
            Color("Marine")
                .ignoresSafeArea()
            
            VStack {
                
                Image("appLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                
                HStack {
                    
                    Button(action: search, label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(searchValue.isEmpty ? .yellow : Color("Dark-Cian"))
                    })
                    
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
                
                SubModuleHome()
                
            }
            .padding(.horizontal, 18)
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
    }
    
    func search() {
        print("The user is searching for: \(self.searchValue)")
    }
    
}

struct SubModuleHome: View {
    
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    
    @State var isPlayerActive = false
    
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    
    var body: some View {
        
        ScrollView {
            VStack {
                
                Text("MOST POPULAR")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                    .padding(.top)
                
                ZStack {
                    
                    Button(action: {self.playVideo(index: 0)}, label: {
                        
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
                        
                        Button(action: {self.playVideo(index: 1)},
                               label: {
                            
                            Image("Spiderman")
                                .resizable()
                                .frame(width: 240, height: 135)
                            
                        })
                        
                        Button(action: {self.playVideo(index: 2)},
                               label: {
                            
                            Image("BattleField6")
                                .resizable()
                                .frame(width: 240, height: 135)
                            
                        })
                        
                        Button(action: {self.playVideo(index: 3)},
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
                        
                        Button(action: {self.playVideo(index: 5)},
                               label: {
                            
                            Image("TheLastOfUs")
                                .resizable()
                                .frame(width: 240, height: 135)
                            
                        })
                        
                        Button(action: {self.playVideo(index: 6)},
                               label: {
                            
                            Image("Uncharted4")
                                .resizable()
                                .frame(width: 240, height: 135)
                            
                        })
                        
                        
                    }
                    
                }
                
            }
        }
        
        
        NavigationLink(destination: VideoPlayer(player: AVPlayer(url: URL(string: self.url)!))
                        .frame(width: 400, height: 300),
                       isActive: $isPlayerActive,
                       label: {EmptyView()})
        
        
    }
    
    func playVideo(index: Int) {
        self.url = self.urlVideos[index]
        print("URL: \(self.url)")
        self.isPlayerActive = true
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
