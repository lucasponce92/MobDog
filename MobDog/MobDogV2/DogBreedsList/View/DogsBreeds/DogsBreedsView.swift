protocol DogsBreedsView: AnyObject{
    var breeds: [String] {get set}
    func showBreedImages(breedName:String)
    func showDogsBreads(dogsBreeds:[String])
}
