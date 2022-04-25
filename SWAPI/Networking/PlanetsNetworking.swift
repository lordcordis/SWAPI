//
//  PlanetsResponse.swift
//  SWAPI
//
//  Created by Wheatley on 15.04.2022.
//

import Foundation





func requestPlanetsListNetworkResponse (stringURL: String, completion: @escaping (PlanetsListNetworkResponse) -> Void) {
    Networking.fetchData(urlString: stringURL) { data in
        do {
            let result = try DecoderSingleton.decoder.decode(PlanetsListNetworkResponse.self, from: data)
            completion(result)
        } catch {
        }
    }
}

func requestPlanetNetworkResponse (stringURL: String, completion: @escaping (PlanetNetworkResponse) -> Void) {
    Networking.fetchData(urlString: stringURL) { data in
        do {
            let result = try DecoderSingleton.decoder.decode(PlanetNetworkResponse.self, from: data)
            completion(result)
        } catch {
        }
    }
}
