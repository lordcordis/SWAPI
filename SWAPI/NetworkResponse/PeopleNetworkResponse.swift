//
//  PEOPLE.swift
//  SWAPI
//
//  Created by Wheatley on 18.04.2022.
//

import Foundation


struct PeopleNetworkResponse: Codable {
    let name, height, mass, hairColor: String
    let skinColor, eyeColor, birthYear, gender: String
    let homeworld: String
    let films: [String]
    let species: [String]?
    let vehicles, starships: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name, height, mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender, homeworld, films, species, vehicles, starships, created, edited, url
    }
}

func peopleResponseConvert(inc: PeopleNetworkResponse) -> People {
    
    
    
    
    let outc = People(name: inc.name, height: inc.height, mass: inc.mass, hairColor: inc.hairColor, skinColor: inc.skinColor, eyeColor: inc.eyeColor, birthYear: inc.birthYear, gender: inc.gender, homeworld: inc.homeworld, films: inc.films, species: inc.species, vehicles: inc.vehicles, starships: inc.starships, created: inc.created, edited: inc.edited, url: inc.url)
    
    return outc
}





