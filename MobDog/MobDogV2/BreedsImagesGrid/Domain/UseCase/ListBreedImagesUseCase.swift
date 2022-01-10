import Foundation

struct ListBreedImagesUseCase{
    
    private let breedImagesRepository: BreedImagesRepository
    
    init(breedImagesRepository: BreedImagesRepository){
        self.breedImagesRepository = breedImagesRepository
    }
    
    func breedImages(breedName:String, completionHandler: @escaping (BreedImages?) -> Void){
        breedImagesRepository.breedImages(breedName: breedName, completionHandler: { response in
            completionHandler(response)
        })
    }
}
