//
//  DogsBreeds.swift
//  MobDog
//
//  Created by Lucas Ponce on 17-12-21.
//

import UIKit

class DogsBreedsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let dogsTableView : UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        tableView.register(BreedCell.self, forCellReuseIdentifier: BreedCell.identifier)
        
        return tableView
    }()
    
    var breeds = [String]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Dogs Breeds"
        self.navigationController?.navigationBar.tintColor = .darkGray
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }

        view.addSubview(dogsTableView)
        
        dogsTableView.delegate = self
        dogsTableView.dataSource = self
        
        getBreeds()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        dogsTableView.frame = view.bounds
    }
    
    func getBreeds(){
        
        self.startLoading()
        Webservice.invoke(urlPath: Endpoints.getEndpointBreeds(name: nil), httpMethod: HttpMethod.GET, finished: { data, status, msg in
            OperationQueue.main.addOperation {
                if status && data != nil {
                    
                    let decodedBreeds = try! JSONDecoder().decode(Breeds.self, from: data!)
                    self.breeds = decodedBreeds.breeds
                    self.dogsTableView.reloadData()
                    
                    self.showTast(message: self.getToastMessage(numberOfBreeds: decodedBreeds.breeds.count))
                    
                }else{
                    self.showTast(message: "No results found")
                }
                
                self.endLoading()
            }
        })
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = dogsTableView.dequeueReusableCell(withIdentifier: BreedCell.identifier, for: indexPath) as! BreedCell
        cell.breedName.text = breeds[indexPath.row].capitalized
        cell.accessoryView = UIImageView(image: UIImage(named: "arrow"))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dogsTableView.deselectRow(at: indexPath, animated: true)
        
        let breedsImagesVC = BreedsImagesVC()
        breedsImagesVC.breedName = self.breeds[indexPath.row]
        
        self.navigationController?.pushViewController(breedsImagesVC, animated: true)
    }
    
    func getToastMessage(numberOfBreeds: Int) -> String{
        
        if numberOfBreeds > 1{
            return "Showing \(numberOfBreeds) found results"
        }else{
            return "Showing \(numberOfBreeds) found result"
        }
    }
}
