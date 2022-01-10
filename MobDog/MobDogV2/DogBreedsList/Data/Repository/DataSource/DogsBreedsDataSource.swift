import Foundation

protocol DogsBreedsDataSource{
    func dogsBreeds(completionHandler: @escaping (DogsBreeds?) -> Void)
}
