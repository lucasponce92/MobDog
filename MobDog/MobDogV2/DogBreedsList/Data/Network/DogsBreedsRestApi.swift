import Foundation

protocol DogsBreedsRestApi {
    func dogsBreeds(completionHandler: @escaping(DogsBreeds?) -> Void )
}
