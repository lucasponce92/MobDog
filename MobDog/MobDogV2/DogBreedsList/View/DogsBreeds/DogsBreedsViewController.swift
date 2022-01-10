import UIKit

class DogsBreedsViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero)
    private var dataSource : DogsBreedsViewDataSource?
    private var delegate : DogsBreedsViewDelegate?
    private var presenter: DogsBreedsPresenterProtocol?
    var breeds = [String]()
    
    convenience init(delegate: DogsBreedsViewDelegate, dataSource: DogsBreedsViewDataSource, presenter: DogsBreedsPresenterProtocol) {
        self.init()
        
        dataSource.view = self
        delegate.view = self
        self.presenter = presenter
        self.delegate = delegate
        self.dataSource = dataSource
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        prepare()
        presenter?.fetchDogsBreeds()
    }
    
    private func prepare() {
        prepareTableView()
    }
    
    private func prepareTableView() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        tableView.register(BreedCell.self, forCellReuseIdentifier: BreedCell.identifier)
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        view.addSubview(tableView)
        addTableViewConstraints()
    }
    
    private func addTableViewConstraints() {
        
        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = DogsBreedsConstants.ViewController.title
        self.navigationController?.navigationBar.tintColor = .darkGray
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = DogsBreedsConstants.ViewController.navItemTitle
    }
}

extension DogsBreedsViewController: DogsBreedsView {
    
    func showDogsBreads(dogsBreeds: [String]) {
        
        self.breeds = dogsBreeds
        self.tableView.reloadData()
    }
    
    func showBreedImages(breedName:String){
        
        let breedImagesServiceLocator = BreedImagesServiceLocator()
        
        let breedImagesPresenter = BreedImagesPresenter(
            listBreedImagesUseCase: breedImagesServiceLocator.listBreedImagesUseCase,
            breedImagesMapper: breedImagesServiceLocator.breedImagesMapper
        )
        
        let breedImagesVC = BreedImagesViewController(
            delegate: BreedImagesViewDelegate(),
            dataSource: BreedImagesViewDataSource(),
            presenter: breedImagesPresenter)
        
        breedImagesVC.breedName = breedName
        breedImagesPresenter.view = breedImagesVC
        
        
        //let breedImagesVC = BreedsImagesVC()
        //breedImagesVC.breedName = breedName
        self.navigationController?.pushViewController(breedImagesVC, animated: true)
    }
}

// EL objetivo del mapper es  convertir un modelo (dominio) en un viewmodel (vista)
