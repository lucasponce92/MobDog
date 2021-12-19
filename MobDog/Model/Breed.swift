//
//  Breed.swift
//  MobDog
//
//  Created by Lucas Ponce on 17-12-21.
//

import Foundation

struct Breeds : Codable {
    
    var breeds : [String]
    
    init(breeds: [String]) {
        self.breeds = breeds
    }

    enum CodingKeys : String, CodingKey {
        case breeds = "message"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        breeds = try values.decode([String].self, forKey: .breeds)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(breeds, forKey: .breeds)
    }
}

