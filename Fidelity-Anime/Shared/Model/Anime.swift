//
//  Anime.swift
//  Fidelity-Anime
//
//  Created by Tottempudi Sri on 12/9/20.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Result.self, from: jsonData)

import Foundation

// MARK: - Result
struct Result: Codable {
    let requestHash: String
    let requestCached: Bool
    let requestCacheExpiry: Int
    let results: [Anime]
    let lastPage: Int

    enum CodingKeys: String, CodingKey {
        case requestHash = "request_hash"
        case requestCached = "request_cached"
        case requestCacheExpiry = "request_cache_expiry"
        case results
        case lastPage = "last_page"
    }
}

// MARK: - Anime
struct Anime: Codable, Equatable {
    let malID: Int
    let url: String
    let imageURL: String
    let title: String
    let airing: Bool
    let synopsis: String
    let type: AnimeType
    let episodes: Int
    let score: Double
    let startDate, endDate: String?
    let members: Int
    let rated: Rated?

    enum CodingKeys: String, CodingKey {
        case malID = "mal_id"
        case url
        case imageURL = "image_url"
        case title, airing, synopsis, type, episodes, score
        case startDate = "start_date"
        case endDate = "end_date"
        case members, rated
    }
}

enum Rated: String, Codable {
    case g = "G"
    case pg = "PG"
    case pg13 = "PG-13"
    case r = "R"
    case ratedR = "R+"
}

enum AnimeType: String, Codable {
    case movie = "Movie"
    case ona = "ONA"
    case ova = "OVA"
    case special = "Special"
    case tv = "TV"
    case music = "Music"
    case none
}
