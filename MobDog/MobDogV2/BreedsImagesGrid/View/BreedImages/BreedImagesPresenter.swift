import Foundation

class BreedImagesPresenter: BreedImagesPresenterProtocol{

    weak var view: BreedImagesView?
    private let listBreedImagesUseCase: ListBreedImagesUseCase
    private let breedImagesMapper: Mapper<BreedImagesViewModel,BreedImages>
    
    init(listBreedImagesUseCase: ListBreedImagesUseCase, breedImagesMapper: Mapper<BreedImagesViewModel,BreedImages>){
        self.listBreedImagesUseCase = listBreedImagesUseCase
        self.breedImagesMapper = breedImagesMapper
    }
    
    func fetchBreedImages(breedName: String) {
        listBreedImagesUseCase.breedImages(breedName: breedName, completionHandler: { [weak self] response in
            
            if let response = response {
                guard let breedImages = self?.breedImagesMapper.reverseMap(model: response) else {
                    return //implementar pantalla de error
                }
                
                self?.view?.showBreedImages(urls: breedImages.urls)
            }else{
                //implementar error
            }
        })
    }
}
