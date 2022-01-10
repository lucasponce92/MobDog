import UIKit

class DogsBreedsViewDelegate: NSObject{
    weak var view: DogsBreedsView?
}

extension DogsBreedsViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return DBCD.rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        view?.showBreedImages(breedName: view?.breeds[indexPath.row] ?? DogsBreedsConstants.DataSource.defaultBreedName)
    }
}
