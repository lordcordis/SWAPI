//
//  PeopleNetworking.swift
//  SWAPI
//
//  Created by Wheatley on 20.04.2022.
//

import Foundation

func requestCharacterNetworkResponse (stringURL: String, completion: @escaping (CharacterNetworkResponse) -> Void) {
    
    Networking.fetchData(urlString: stringURL) { data in
        do {
            let result = try DecoderSingleton.decoder.decode(CharacterNetworkResponse.self, from: data)
            completion(result)
        } catch {

        }
    }
}


