//
//  PeopleNetworking.swift
//  SWAPI
//
//  Created by Wheatley on 20.04.2022.
//

import Foundation

func requestPeopleNetworkResponse (stringURL: String, completion: @escaping (PeopleNetworkResponse) -> Void) {
    
    Networking.fetchData(urlString: stringURL) { data in
        do {
            let result = try DecoderSingleton.decoder.decode(PeopleNetworkResponse.self, from: data)
            completion(result)
        } catch {

        }
    }
}


