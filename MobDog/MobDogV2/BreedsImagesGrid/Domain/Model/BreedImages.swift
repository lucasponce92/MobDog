import Foundation

struct BreedImages: Decodable{
    let urls : [String]
    
    enum CodingKeys : String, CodingKey {
        case urls = "message"
    }
}
