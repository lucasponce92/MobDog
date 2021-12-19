//
//  ImageCell.swift
//  MobDog
//
//  Created by Lucas Ponce on 17-12-21.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    static let identifier = "breedImageCell"
    
    let dogImage: CustomImageView = {
        let imageView = CustomImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(dogImage)
        contentView.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        dogImage.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
