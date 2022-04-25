//
//  People.swift
//  SWAPI
//
//  Created by Wheatley on 25.04.2022.
//

import Foundation

struct People: Codable {
    let name, height, mass, hairColor: String
    let skinColor, eyeColor, birthYear, gender: String
    let homeworld: String
    let films: [String]
    let species: [String]?
    let vehicles: [String]
    let starships: [String]
    let created, edited: String
    let url: String
}
