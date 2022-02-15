//
//  ImageView.swift
//  GameStream
//
//  Created by Julian Castro Ruge on 14/02/22.
//

import SwiftUI
import Kingfisher

struct ImageView: View {
    
    var url: String
    
    var body: some View {
        
        VStack {
         
            if #available(iOS 15.0, *) {
                
                AsyncImage(url: URL(string: url)) { phase in
                    
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
                
                KFImage(URL(string: url)!)
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.bottom, 12)
                
            }
            
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: "https://cdn.cloudflare.steamstatic.com/steam/apps/292030/ss_107600c1337accc09104f7a8aa7f275f23cad096.600x338.jpg")
    }
}
