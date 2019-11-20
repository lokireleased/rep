//
//  RepresentativeController.swift
//  Rep
//
//  Created by tyson ericksen on 11/20/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

import Foundation


class RepresentativeController {
    
    
//http://whoismyrepresentative.com/getall_reps_bystate.php?state=CA
    
    static let baseURL = URL(string: "https://whoismyrepresentative.com/getall_reps_bystate.php")
    
    static func searchRepresentatives(forState state: String, completion: @escaping (([Representative])) -> Void) {
        
        guard let url = baseURL else { completion([]); return }
        
        let stateQuery = URLQueryItem(name: "state", value: state.lowercased())
        let jsonQuery = URLQueryItem(name: "output", value: "json")
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = [stateQuery, jsonQuery]
        guard let requestURL = components?.url else { completion([]); return }
        
        URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
            if let error = error {
                print(error)
                completion([])
                return
            }

            guard let data = data, let responseDataString = String(data: data, encoding: .ascii), let fixedData = responseDataString.data(using: .utf8) else { completion([]); return }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let resultsDictionary = try jsonDecoder.decode([String: [Representative]].self, from: fixedData)
                let repArray = resultsDictionary["results"]
                completion(repArray ?? ([]))
                return
            } catch {
                print(error)
                completion([])
                return
            }
        }.resume()
    }
}
