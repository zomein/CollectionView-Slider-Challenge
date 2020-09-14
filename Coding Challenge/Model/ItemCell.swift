//
//  MainCollectionViewCell.swift
//  Coding Challenge
//
//  Created by Eric Barnes on 9/10/20.
//  Copyright © 2020 Eric Barnes. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {
    
    @IBOutlet weak var imageview: UIImageView!
    
    var testImage: UIImageView = {
        let image = #imageLiteral(resourceName: "300")
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(for image: UIImage) {
        backgroundColor = .darkGray
        addSubview(testImage)
        testImage.image = image
        NSLayoutConstraint.activate([
            testImage.topAnchor.constraint(equalTo: topAnchor),
            testImage.leftAnchor.constraint(equalTo: leftAnchor),
            testImage.rightAnchor.constraint(equalTo: rightAnchor),
            testImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
}
