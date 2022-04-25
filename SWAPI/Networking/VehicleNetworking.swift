//
//  VehicleNetworking.swift
//  SWAPI
//
//  Created by Wheatley on 25.04.2022.
//

import Foundation
func requestVehicleNetworkResponse (stringURL: String, completion: @escaping (VehicleNetworkResponse) -> Void) {
    
    Networking.fetchData(urlString: stringURL) { data in
        do {
            let result = try DecoderSingleton.decoder.decode(VehicleNetworkResponse.self, from: data)
            completion(result)
        } catch {

        }
    }
}
