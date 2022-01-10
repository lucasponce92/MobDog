import Foundation

class BreedImagesToBreedImagesViewModel: Mapper<BreedImagesViewModel, BreedImages> {
    
    override func reverseMap(model: BreedImages) -> BreedImagesViewModel {
        return BreedImagesViewModel(urls: model.urls)
    }
}
