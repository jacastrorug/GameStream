//
//  SearchGame.swift
//  GameStream
//
//  Created by Julian Castro Ruge on 15/02/22.
//

import Foundation


class SearchGame: ObservableObject {
    
    @Published var gamesInfo = [Game]()
    
    func search(gameName: String) {
        
        gamesInfo.removeAll()
        
        let gameNameSpaces = gameName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let url = URL(string: "https://gamestream-api.herokuapp.com/api/games/search?contains=\(gameNameSpaces ?? "cuphead")")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            do {
                
                if let jsonData = data {
                    print("JSON Size: \(jsonData)")
                    
                    let decodedData = try JSONDecoder().decode(Results.self, from: jsonData)
                    
                    DispatchQueue.main.async {
                        self.gamesInfo.append(contentsOf: decodedData.results)
                    }
                    
                }
                
            } catch {
                print("Error searching for the game \(gameName): \(error.localizedDescription)")
            }
            
        }.resume()
        
    }
    
}
