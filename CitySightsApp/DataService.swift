//
//  DataService.swift
//  CitySightsApp
//
//  Created by Gerald Zhao on 4/26/25.
//

import Foundation

struct DataService {
    
    let API_KEY = "kMsNpMvYPm9FeBAsCgWLWcwyTFM2c7xH_Xu1DanOvaJ2RwCT7ElqqqCshXG_0udqK4aY-iJKgK8S03qTjZy68YS2v_Wr_qdEaZMnuCLwzLCaPXiOtiqnpaOXkebzZ3Yx"
    
    
    func businessSearch() async {
        
//        // check if api key exists
//        guard apiKey != nil else {
//            return
//        }
        
        // create url
        
        if let url = URL(string: "https://api.yelp.com/v3/businesses/search?latitude=37.78825&longitude=-122.4324&categories=restaurants&limit=10") {
            
            // create request
            var request = URLRequest(url: url)
            request.addValue("Bearer \(API_KEY)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "accept")
            
            
            // send request
            do{
                let(data, response) = try await URLSession.shared.data(for: request)
                print(data)
                print(response)
                
            }
            catch{
                print(error)
            }
        }
    
        
    }
    
    
}
