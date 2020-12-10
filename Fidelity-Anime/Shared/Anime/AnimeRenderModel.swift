//
//  SearchRenderModel.swift
//  Fidelity-Anime
//
//  Created by Tottempudi Sri on 12/10/20.
//

import Foundation

struct AnimeRenderModel: Identifiable, Hashable {
    var id: String
    var title: String
    var url: String
    var imageURL: URL
    var isAiring: Bool

    init(anime: Anime) {
        self.id = String(anime.malID)
        self.title = anime.title
        self.url =  anime.imageURL
        self.imageURL = URL(string: anime.imageURL)!
        self.isAiring = anime.airing
    }

    init(id: String) {
        self.id = id
        self.title = "Hello"
        self.url = ""
        self.imageURL = URL(string: "")!
        self.isAiring = true
    }
}
