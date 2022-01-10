import UIKit

class BreedImagesViewController: UIViewController {
 
    private var dataSource : BreedImagesViewDataSource?
    private var delegate : BreedImagesViewDelegate?
    private var presenter: BreedImagesPresenterProtocol?
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    var urls = [String]()
    var breedName = String()
    
    convenience init(delegate: BreedImagesViewDelegate, dataSource: BreedImagesViewDataSource, presenter: BreedImagesPresenterProtocol){
        self.init()
        
        dataSource.breedImagesViewController = self
        delegate.breedImagesViewController = self
        self.presenter = presenter
        self.delegate = delegate
        self.dataSource = dataSource
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepare()
        presenter?.fetchBreedImages(breedName: breedName)
    }
    
    private func prepare() {
        
        self.view.backgroundColor = .white
        prepareCollectionView()
    }
    
    private func prepareCollectionView() {
        
        view.addSubview(collectionView)
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.identifier)
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .white
        collectionView.dataSource = dataSource
        addCollectionViewConstraints()
        
        if #available(iOS 13.0, *){
            collectionView.collectionViewLayout = createLayout()
        }else{
            collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        }
    }
    
    private func addCollectionViewConstraints() {
        
        let constraints = [
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @available(iOS 13.0, *)
    private func createLayout() -> UICollectionViewCompositionalLayout{
        
        //ITEMS
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(2/3), heightDimension: .fractionalHeight(1)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let vStack = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5)))
        vStack.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        //GROUPS
        
        let vStackGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1)), subitem: vStack, count: 2)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(3/5)),
            subitems: [
                item,
                vStackGroup
            ]
        )
        
        //SECTION
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = breedName.capitalized
        self.navigationController?.navigationBar.tintColor = .darkGray
    }
}

extension BreedImagesViewController: BreedImagesView {
    
    func showBreedImages(urls: [String]) {
        self.urls = urls
        self.collectionView.reloadData()
    }
    
}
