//
//  BreedCell.swift
//  MobDog
//
//  Created by Lucas Ponce on 17-12-21.
//

import UIKit

class BreedCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    private let dogIcon: UIImageView = {
       
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dog")
        imageView.contentMode = .scaleAspectFit
        return imageView
        
    }()
    
    let breedName: UILabel = {
       
        let label = UILabel()
        label.textColor = .darkGray
        return label
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(dogIcon)
        contentView.addSubview(breedName)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        dogIcon.frame = CGRect(x: 16, y: 8, width: 25, height: contentView.frame.size.height - 16)
        breedName.frame = CGRect(x: 32 + dogIcon.frame.size.width, y: 8, width: contentView.frame.size.width, height: contentView.frame.size.height - 16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
