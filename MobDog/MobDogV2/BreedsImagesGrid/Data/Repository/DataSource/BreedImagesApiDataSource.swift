import Foundation

class BreedImagesApiDataSource: BreedImagesDataSource{
    
    private let breedImagesRestApi: BreedImagesRestApi
    
    init(breedImagesRestApi: BreedImagesRestApi){
        self.breedImagesRestApi = breedImagesRestApi
    }
    
    func breedImages(breedName:String, completionHandler: @escaping (BreedImages?) -> Void) {
        breedImagesRestApi.breedImages(breedName: breedName, completionHandler: { response in
            if let response = response {
                completionHandler(response)
            }else{
                //implementar error
            }
        })
    }
}
