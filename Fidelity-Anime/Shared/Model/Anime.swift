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
    let requestHash: String?
    let requestCached: Bool
    let requestCacheExpiry: Int?
    let results: [Anime]
    let lastPage: Int?

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
    var malID: Int
    var title: String
    var imageURL: String
    var url: String?
    var airing: Bool?
    var synopsis: String?
    var type: AnimeType?
    var episodes: Int?
    var score: Double?
    var startDate, endDate: String?
    var members: Int?
    var rated: Rated?

    enum CodingKeys: String, CodingKey {
        case malID = "mal_id"
        case url
        case imageURL = "image_url"
        case title, airing, synopsis, type, episodes, score
        case startDate = "start_date"
        case endDate = "end_date"
        case members, rated
    }


    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        malID = try container.decode(Int.self, forKey: .malID)
        title = try container.decode(String.self, forKey: .title)
        imageURL = try container.decode(String.self, forKey: .imageURL)

        url = try? container.decode(String.self, forKey: .url)
        airing = try? container.decode(Bool.self, forKey: .airing)
        synopsis = try? container.decode(String.self, forKey: .synopsis)
        type =  try? container.decode(AnimeType.self, forKey: .synopsis)
        episodes =  try? container.decode(Int.self, forKey: .episodes)
        score =  try? container.decode(Double.self, forKey: .score)
        startDate =  try? container.decode(String.self, forKey: .startDate)
        endDate =  try? container.decode(String.self, forKey: .endDate)
        members =  try? container.decode(Int.self, forKey: .members)
        rated =  try? container.decode(Rated.self, forKey: .rated)
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
