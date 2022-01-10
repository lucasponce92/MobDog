import Foundation

struct DogsBreeds: Decodable{
    let breeds: [String]
    
    enum CodingKeys : String, CodingKey {
        case breeds = "message"
    }
}
