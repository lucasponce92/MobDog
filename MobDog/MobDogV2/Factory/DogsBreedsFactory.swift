import UIKit

class DogsBreedsFactory {
    private let dogsBreedsServiceLocator: DogsBreedsServiceLocator
    
    init(dogsBreedsServiceLocator: DogsBreedsServiceLocator) {
        self.dogsBreedsServiceLocator = dogsBreedsServiceLocator
    }
    
    func viewController() -> UIViewController {
        
        let presenter = DogsBreedsPresenter(
            dogsBreedsUseCase: dogsBreedsServiceLocator.dogsBreedsUseCase,
            dogsBreedsMapper: dogsBreedsServiceLocator.dogsBreedsMapper
        )
        
        let viewController = DogsBreedsViewController(
            delegate: DogsBreedsViewDelegate(),
            dataSource: DogsBreedsViewDataSource(),
            presenter: presenter
        )
        
        presenter.view = viewController
        
        viewController.title = DogsBreedsConstants.ViewController.title
        return viewController
    }
}
