import Foundation

class DogsBreedsApiRepository: DogsBreedsRepository{
    
    private let dogsBreedsDataSource: DogsBreedsDataSource
    
    init(dogsBreedsDataSource: DogsBreedsDataSource){
        self.dogsBreedsDataSource = dogsBreedsDataSource
    }
    
    func dogsBreeds(completionHandler: @escaping (DogsBreeds?) -> Void) {
        dogsBreedsDataSource.dogsBreeds(completionHandler: { response in
            if let response = response {
                completionHandler(response)
            }else{
                //implementar error
            }
        })
    }
}
