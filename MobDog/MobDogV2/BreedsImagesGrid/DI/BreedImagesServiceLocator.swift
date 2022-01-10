import Foundation

class BreedImagesServiceLocator{
    private let breedImagesRestApi = BreedImagesURLSessionRestApi()
    private lazy var breedImagesDataSource: BreedImagesDataSource = BreedImagesApiDataSource(breedImagesRestApi: breedImagesRestApi)
    private lazy var breedImagesRepository: BreedImagesRepository = BreedImagesApiRepository(breedImagesDataSource: breedImagesDataSource)
    lazy var listBreedImagesUseCase: ListBreedImagesUseCase = ListBreedImagesUseCase(breedImagesRepository: breedImagesRepository)
    lazy var breedImagesMapper: Mapper<BreedImagesViewModel, BreedImages> = BreedImagesToBreedImagesViewModel()
}
