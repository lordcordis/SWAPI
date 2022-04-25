//
//  PlanetPresenter.swift
//  SWAPI
//
//  Created by Wheatley on 15.04.2022.
//

import Foundation

func planetDescription (planet: PlanetNetworkResponse) -> [String] {
    
    let planetToPresent: String = """
    Rotation period: \(planet.rotationPeriod) \n
    Orbital period: \(planet.orbitalPeriod) \n
    Diameter: \(planet.diameter) \n
    Climate: \(planet.climate.capitalized) \n
    Gravity: \(planet.gravity.capitalized) \n
    Terrain: \(planet.terrain.capitalized) \n
    Surface water level: \(planet.surfaceWater.capitalized) \n
    Population: \(planet.population) \n
    Films: \(planet.films) \n
    """
    
    let name = String(planet.name)

    let result = [planetToPresent, name]
    
    return result
    
}
