//
//  BreedsImagesVC.swift
//  MobDog
//
//  Created by Lucas Ponce on 17-12-21.
//

import UIKit

class BreedsImagesVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var breedName = String()
    var imageUrls = [String]()
    
    let imagesCollectionView : UICollectionView = {
        if #available(iOS 13.0, *) {
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: BreedsImagesVC.createLayout())
            return collectionView
        } else {
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
            return collectionView
        }
        
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = breedName.capitalized
        self.navigationController?.navigationBar.tintColor = .darkGray
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        view.addSubview(imagesCollectionView)
        imagesCollectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.identifier)
        imagesCollectionView.frame = view.bounds
        imagesCollectionView.backgroundColor = .white
        imagesCollectionView.dataSource = self
        imagesCollectionView.delegate = self
        
        getBreedImages(breedName: self.breedName)
    }
    
    @available(iOS 13.0, *)
    static func createLayout() -> UICollectionViewCompositionalLayout{
        
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
    
    func getBreedImages(breedName:String){
        
        self.startLoading()
        Webservice.invoke(urlPath: Endpoints.getEndpointBreeds(name: breedName), httpMethod: HttpMethod.GET, finished: { data, status, msg in
            OperationQueue.main.addOperation {
                if status && data != nil {
                    
                    let decodedBreedImages = try! JSONDecoder().decode(Breeds.self, from: data!)
                    self.imageUrls = decodedBreedImages.breeds
                    self.imagesCollectionView.reloadData()
                    
                }else{
                    self.showTast(message: "No results found")
                }
                
                self.endLoading()
            }
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imagesCollectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as! ImageCell
        cell.dogImage.loadImageUsingUrlString(urlString: self.imageUrls[indexPath.row])
        
        return cell
    }
    
    
    // SOPORTE IOS < 13
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width/3)-3, height: (view.frame.size.width/3)-3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }
    
}
