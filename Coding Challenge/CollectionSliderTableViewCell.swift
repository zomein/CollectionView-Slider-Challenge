//
//  CollectionSliderTableViewCell.swift
//  Coding Challenge
//
//  Created by Eric Barnes on 9/10/20.
//  Copyright © 2020 Eric Barnes. All rights reserved.
//

import UIKit

class CollectionRowTableViewCell: UITableViewCell {
    
    var myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false // since we're using programmatic constraints
        cv.backgroundColor = .magenta
        return cv
    }()
    
    var tv: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupViews() {
        addSubview(tv)
        tv.addSubview(myCollectionView)
        setupCollectionView()
        
        DispatchQueue.main.async {
            NSLayoutConstraint.activate([
                self.tv.leftAnchor.constraint(equalTo: self.leftAnchor),
                self.tv.rightAnchor.constraint(equalTo: self.rightAnchor),
                self.tv.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                self.tv.topAnchor.constraint(equalTo: self.topAnchor),
                self.myCollectionView.topAnchor.constraint(equalTo: self.tv.topAnchor, constant: 5),
                self.myCollectionView.leftAnchor.constraint(equalTo: self.tv.leftAnchor, constant: 5),
                self.myCollectionView.bottomAnchor.constraint(equalTo: self.tv.bottomAnchor, constant: -5),
                self.myCollectionView.rightAnchor.constraint(equalTo: self.tv.rightAnchor, constant: -5)
            ])
        }
    }
    
    func configure() {
        setupViews()
    }
    
    private func setupCollectionView() {
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(SliderViewCell.self, forCellWithReuseIdentifier: "sliderCell")
    }
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        
//        // Configure the view for the selected state
//    }
    
}

extension CollectionRowTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "sliderCell", for: indexPath) as! SliderViewCell
        cell.configure()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 3, height: frame.height)
    }
}
