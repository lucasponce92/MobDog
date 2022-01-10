import UIKit

class BreedImagesFactory {
    private let breedImagesServiceLocator: BreedImagesServiceLocator
    
    init(breedImagesServiceLocator: BreedImagesServiceLocator) {
        self.breedImagesServiceLocator = breedImagesServiceLocator
    }
    
    func viewController() -> UIViewController {
        
        let presenter = BreedImagesPresenter(
            listBreedImagesUseCase: breedImagesServiceLocator.listBreedImagesUseCase,
            breedImagesMapper: breedImagesServiceLocator.breedImagesMapper
        )
        
        let viewController = BreedImagesViewController(
            delegate: BreedImagesViewDelegate(),
            dataSource: BreedImagesViewDataSource(),
            presenter: presenter
        )
        
        presenter.view = viewController
        
        return viewController
    }
}
