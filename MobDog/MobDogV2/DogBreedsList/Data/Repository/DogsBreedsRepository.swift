import Foundation

protocol DogsBreedsRepository{
    func dogsBreeds(completionHandler: @escaping (DogsBreeds?) -> Void)
}
