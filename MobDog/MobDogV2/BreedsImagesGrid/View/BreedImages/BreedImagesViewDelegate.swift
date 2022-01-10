import UIKit

class BreedImagesViewDelegate: NSObject{
    weak var breedImagesViewController: BreedImagesViewController?
}

extension BreedImagesViewDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: ((breedImagesViewController?.view.frame.size.width ?? 0)/3)-3, height: ((breedImagesViewController?.view.frame.size.width ?? 0)/3)-3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return BreedImagesConstants.Delegate.collectionViewSpacingSection
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return BreedImagesConstants.Delegate.collectionViewLineSpacingSection
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return BreedImagesConstants.Delegate.collectionViewEdgeInsets
    }
}
