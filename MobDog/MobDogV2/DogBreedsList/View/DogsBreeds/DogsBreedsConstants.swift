import UIKit

typealias DBCD = DogsBreedsConstants.Delegate

enum DogsBreedsConstants{
    enum Delegate {
        static let rowHeight: CGFloat = 60
    }
    
    enum DataSource{
        static let cellImageName: String = "arrow"
        static let defaultBreedName: String = ""
    }
    
    enum ViewController{
        static let title: String = "Dogs Breeds"
        static let navItemTitle: String = ""
    }
}
