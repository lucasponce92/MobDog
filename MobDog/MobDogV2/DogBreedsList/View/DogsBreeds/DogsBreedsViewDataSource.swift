import UIKit

class DogsBreedsViewDataSource: NSObject{
    weak var view: DogsBreedsView?
}

extension DogsBreedsViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return view?.breeds.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BreedCell.identifier, for: indexPath) as! BreedCell
        cell.breedName.text = view?.breeds[indexPath.row].capitalized ?? DogsBreedsConstants.DataSource.defaultBreedName
        cell.accessoryView = UIImageView(image: UIImage(named: DogsBreedsConstants.DataSource.cellImageName))
        return cell
    }
}
