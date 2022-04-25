//
//  FilmNetworking.swift
//  SWAPI
//
//  Created by Wheatley on 25.04.2022.
//

import Foundation

func requestFilmNetworkResponse (stringURL: String, completion: @escaping (FilmNetworkResponse) -> Void) {
    
    Networking.fetchData(urlString: stringURL) { data in
        do {
            let result = try DecoderSingleton.decoder.decode(FilmNetworkResponse.self, from: data)
            completion(result)
        } catch {

        }
    }
}
