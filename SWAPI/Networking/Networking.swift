//
//  Networking.swift
//  SWAPI
//
//  Created by Wheatley on 13.04.2022.
//

import Foundation


class DecoderSingleton {
    static let decoder = JSONDecoder()
}

class Networking {
    
    static func fetchData (urlString: String, completion: @escaping (Data) -> Void) {
        
        guard let url = URL(string: urlString) else {return}
        
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            if let data = data {
                completion(data)
            }
        }.resume()
        
    }
}


