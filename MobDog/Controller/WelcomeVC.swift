//
//  WelcomeVC.swift
//  MobDog
//
//  Created by Lucas Ponce on 17-12-21.
//

import UIKit

class WelcomeVC: UIViewController {
    
    let welcomeLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome to Dogs Breeds Challenge"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.alpha = 0
        self.view.addSubview(welcomeLabel)
        addConstraints()
        
    }
    
    override func viewDidLayoutSubviews() {
        self.view.setGradientBackground(colorOne: .lightGray, colorTwo: .white)
        
        UIView.animate(withDuration: 1.5, animations: {
            self.welcomeLabel.alpha = 1.0
        }, completion: { _ in
            
            let dogsBreedsVC = DogsBreedsVC()
            self.navigationController?.pushViewController(dogsBreedsVC, animated: true)
        })
        
    }
    
    func addConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(welcomeLabel.widthAnchor.constraint(equalToConstant: view.frame.width - 64))
        constraints.append(welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension UIView {
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor){
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorTwo.cgColor, colorOne.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
