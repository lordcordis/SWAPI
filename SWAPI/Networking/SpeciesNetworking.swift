//
//  SpeciesNetworking.swift
//  SWAPI
//
//  Created by Wheatley on 25.04.2022.
//

import Foundation
func requestStarshipNetworkResponse (stringURL: String, completion: @escaping (SpeciesNetworkResponse) -> Void) {
    
    Networking.fetchData(urlString: stringURL) { data in
        do {
            let result = try DecoderSingleton.decoder.decode(SpeciesNetworkResponse.self, from: data)
            completion(result)
        } catch {

        }
    }
}
