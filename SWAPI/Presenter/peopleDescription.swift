//
//  PeopleDescription.swift
//  SWAPI
//
//  Created by Wheatley on 25.04.2022.
//

import Foundation

func peopleDescription (people: People) -> String {
    
    let output = """
height: \(people.height) \n
mass: \(people.mass) \n
hairColor: \(people.hairColor) \n
skinColor: \(people.skinColor) \n
eyeColor: \(people.eyeColor) \n
birthYear: \(people.birthYear) \n
gender: \(people.gender) \n
films: \([people.films]) \n
species: \([people.species]) \n
vehicles: \(people.vehicles) \n
starships: \(people.starships) \n
"""
    
    
    return output
}
