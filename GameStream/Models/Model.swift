//
//  Model.swift
//  GameStream
//
//  Created by Julian Castro Ruge on 1/02/22.
//

import Foundation


struct Games: Codable {
    
    let games: [Game]
    
}

struct Game: Codable, Hashable {
    
    let title: String
    let studio: String
    let contentRaiting: String
    let publicationYear: String
    let description: String
    let platforms: [String]
    let tags: [String]
    let videosUrls: VideoUrl
    let galleryImages: [String]
    
}

struct VideoUrl: Codable, Hashable {
    let mobile: String
    let tablet: String
}
