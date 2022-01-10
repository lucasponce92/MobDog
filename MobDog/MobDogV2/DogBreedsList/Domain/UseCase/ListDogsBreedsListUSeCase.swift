import Foundation

struct ListDogsBreedsListUSeCase {
    
    private let dogsBreedsRepository: DogsBreedsRepository
    
    init(dogsBreedsRepository: DogsBreedsRepository){
        self.dogsBreedsRepository = dogsBreedsRepository
    }
    
    func dogsBreeds(completionHandler: @escaping (DogsBreeds?) -> Void){
        dogsBreedsRepository.dogsBreeds(completionHandler: {response in
            completionHandler(response)
        })
    }
}
