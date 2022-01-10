import UIKit

class ViewControllerFactory {
    
    private static var dogsBreedsServiceLocator = DogsBreedsServiceLocator()
    private static var breedImagesServiceLocator = BreedImagesServiceLocator()
    
    func viewController(type: ViewControllerTypes) -> UIViewController {
        switch type {
        case .dogsBreedsViewController:
            let factory = DogsBreedsFactory(dogsBreedsServiceLocator: ViewControllerFactory.dogsBreedsServiceLocator)
            return factory.viewController()
            
        case .breedImagesViewController:
            let factory = BreedImagesFactory(breedImagesServiceLocator: ViewControllerFactory.breedImagesServiceLocator)
            return factory.viewController()
        }
    }
}
