import Foundation

protocol BreedImagesDataSource{
    func breedImages(breedName:String, completionHandler: @escaping (BreedImages?) -> Void)
}
