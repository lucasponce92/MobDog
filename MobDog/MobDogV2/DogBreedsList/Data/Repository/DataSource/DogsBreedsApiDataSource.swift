import Foundation

class DogsBreedsApiDataSource: DogsBreedsDataSource{
    
    private let dogsBreedsRestApi: DogsBreedsRestApi
    
    init(dogsBreedsRestApi: DogsBreedsRestApi){
        self.dogsBreedsRestApi = dogsBreedsRestApi
    }
    
    func dogsBreeds(completionHandler: @escaping (DogsBreeds?) -> Void) {
        dogsBreedsRestApi.dogsBreeds(completionHandler: { response in
            if let response = response {
                completionHandler(response)
            }else{
                //implementar error
            }
        })
    }
}
