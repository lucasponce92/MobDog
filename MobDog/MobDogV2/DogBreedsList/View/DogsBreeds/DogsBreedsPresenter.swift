import Foundation

class DogsBreedsPresenter: DogsBreedsPresenterProtocol{
    weak var view: DogsBreedsView?
    private let listDogsBreedsUseCase: ListDogsBreedsListUSeCase
    private let dogsBreedsMapper: Mapper<DogsBreedsViewModel,DogsBreeds>
    
    init(dogsBreedsUseCase: ListDogsBreedsListUSeCase, dogsBreedsMapper: Mapper<DogsBreedsViewModel,DogsBreeds>){
        self.listDogsBreedsUseCase = dogsBreedsUseCase
        self.dogsBreedsMapper = dogsBreedsMapper
    }
    
    func fetchDogsBreeds() {
        listDogsBreedsUseCase.dogsBreeds(completionHandler: { [weak self] response in
            if let response = response {
                guard let dogBreeds = self?.dogsBreedsMapper.reverseMap(model: response) else {
                    return //implementar pantalla de error
                }
                
                self?.view?.showDogsBreads(dogsBreeds: dogBreeds.breeds)
            }else {
                //implementar error
            }
        })
    }
}
