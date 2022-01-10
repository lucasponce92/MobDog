import Foundation

protocol BreedImagesRepository{
    func breedImages(breedName:String, completionHandler: @escaping (BreedImages?) -> Void)
}
