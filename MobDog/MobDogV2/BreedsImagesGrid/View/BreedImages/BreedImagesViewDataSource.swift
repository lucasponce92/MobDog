import UIKit

class BreedImagesViewDataSource: NSObject {
    weak var breedImagesViewController: BreedImagesViewController?
}

extension BreedImagesViewDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return breedImagesViewController?.urls.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as! ImageCell
        cell.dogImage.loadImageUsingUrlString(urlString: breedImagesViewController?.urls[indexPath.row] ?? BreedImagesConstants.DataSource.defaultUrl)
        
        return cell
    }
}
