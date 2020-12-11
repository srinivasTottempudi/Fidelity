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
    var imageURL: URL
    var isAiring: Bool
    var rating: Rated?
    var synopsis: String
    var score: Double

    //Initializing render model with DataModel (Anime)
    init(anime: Anime) {
        self.id = String(anime.malID)
        self.title = anime.title
        self.imageURL = URL(string: anime.imageURL)!
        self.isAiring = anime.airing
        self.rating = anime.rated
        self.synopsis = anime.synopsis
        self.score = anime.score
    }

    // Demo remder model for Preview
    init(id: String) {
        self.id = id
        self.title = "Hello"
        self.imageURL = URL(string: "https://cdn.myanimelist.net/images/anime/10/11244.jpg?s=04a45f30a2d3fa666388fcb5dab37750")!
        self.isAiring = true
        self.rating = .pg13
        self.synopsis = "This is synopsis"
        self.score = 5.5
    }
}
