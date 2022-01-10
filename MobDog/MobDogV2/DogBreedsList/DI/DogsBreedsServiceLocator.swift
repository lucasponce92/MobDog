import Foundation

class DogsBreedsServiceLocator {
    
    private let dogsBreedsRestApi = DogsBreedsURLSessionRestApi()
    
    private lazy var dogsBreedsDataSource: DogsBreedsDataSource = DogsBreedsApiDataSource(dogsBreedsRestApi: dogsBreedsRestApi)

    private lazy var dogsBreedsRepository: DogsBreedsRepository = DogsBreedsApiRepository(dogsBreedsDataSource: dogsBreedsDataSource)
    
    lazy var dogsBreedsUseCase: ListDogsBreedsListUSeCase = ListDogsBreedsListUSeCase(dogsBreedsRepository: dogsBreedsRepository)
    lazy var dogsBreedsMapper: Mapper<DogsBreedsViewModel, DogsBreeds> = DogsBreedsToDogsBreedsViewModelMapper()
}
