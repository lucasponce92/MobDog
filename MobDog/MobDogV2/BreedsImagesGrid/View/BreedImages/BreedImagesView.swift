import UIKit

protocol BreedImagesView: AnyObject{
    var breedName: String {get set}
    var urls: [String] {get set}
    func showBreedImages(urls:[String])
}
