//
//  Film.swift
//  SWAPI
//
//  Created by Wheatley on 20.04.2022.
//

import Foundation

struct FilmNetworkResponse: Codable {
    
    let title: String
    let episodeID: Int
    let openingCrawl, director, producer, releaseDate: String
    let characters, planets, starships, vehicles: [String]
    let species: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case title
        case episodeID = "episode_id"
        case openingCrawl = "opening_crawl"
        case director, producer
        case releaseDate = "release_date"
        case characters, planets, starships, vehicles, species, created, edited, url
    }
}

func filmDescription (film: FilmNetworkResponse) -> String {
    let output = """
    title: \(film.title)\n
    episodeID: \(film.episodeID)\n
    openingCrawl: \(film.openingCrawl)\n
    director: \(film.director)\n
    producer: \(film.producer)\n
    releaseDate: \(film.releaseDate)\n
    characters: \(film.characters)\n
    planets: \(film.planets)\n
    starships: \(film.planets)\n
    vehicles: \(film.planets)\n
    species: \(film.species)\n
    """
    return output
}
