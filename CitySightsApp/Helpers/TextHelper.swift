//
//  TextHelper.swift
//  CitySightsApp
//
//  Created by Gerald Zhao on 4/29/25.
//

import Foundation

struct TextHelper {
    static func distanceAway(meters: Double) -> String {
        if meters > 1000 {
            return "\(Int(round(meters/1000))) km away"
        } else {
            return "\(Int(round(meters))) m away"
        }
    }
}
