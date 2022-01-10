import Foundation

class DogsBreedsToDogsBreedsViewModelMapper: Mapper<DogsBreedsViewModel, DogsBreeds> {
    
    override func reverseMap(model: DogsBreeds) -> DogsBreedsViewModel {
        return DogsBreedsViewModel(breeds: model.breeds)
    }
}
