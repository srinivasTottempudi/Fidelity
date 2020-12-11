//
//  SearchRenderModel.swift
//  Fidelity-Anime
//
//  Created by Tottempudi Sri on 12/10/20.
//

import Foundation

/// Anime view representable
struct AnimeRenderModel: Identifiable, Hashable {
    var id: String
    var title: String
    var url: String
    var imageURL: URL
    var isAiring: Bool
    var rating: String

    //Initializing render model with DataModel (Anime)
    init(anime: Anime) {
        self.id = String(anime.malID)
        self.title = anime.title
        self.url =  anime.imageURL
        self.imageURL = URL(string: anime.imageURL)!
        self.isAiring = anime.airing
        self.rating = anime.rated?.rawValue ?? ""
    }

    // Demo remder model for Preview
    init(id: String) {
        self.id = id
        self.title = "Hello"
        self.url = "https://cdn.myanimelist.net/images/anime/10/11244.jpg?s=04a45f30a2d3fa666388fcb5dab37750"
        self.imageURL = URL(string: "https://cdn.myanimelist.net/images/anime/10/11244.jpg?s=04a45f30a2d3fa666388fcb5dab37750")!
        self.isAiring = true
        self.rating = "PG"
    }
}
