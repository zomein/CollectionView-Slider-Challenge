//
//  CollectionSliderTableViewCell.swift
//  Coding Challenge
//
//  Created by Eric Barnes on 9/10/20.
//  Copyright © 2020 Eric Barnes. All rights reserved.
//

import UIKit

class CollectionRowTableViewCell: UITableViewCell {
    
    let mockImageData = [#imageLiteral(resourceName: "hangover"), #imageLiteral(resourceName: "conjuring"), #imageLiteral(resourceName: "300")]
    
    var myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false // since we're using programmatic constraints
        cv.backgroundColor = .black
        return cv
    }()
    
    var collectionContainerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .black
        return v
    }()
    
    var seperatorView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .black
        return v
    }()
    
    var headerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .black
        return v
    }()
    
    var headerLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .white
        l.font = UIFont.boldSystemFont(ofSize: 15)
        return l
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(for data: String) {
        addSubview(collectionContainerView)
        addSubview(headerView)
        addSubview(seperatorView)
        headerView.addSubview(headerLabel)
        headerLabel.text = data
        collectionContainerView.addSubview(myCollectionView)
        setupCollectionView()
        
        DispatchQueue.main.async {
            NSLayoutConstraint.activate([
                self.headerView.topAnchor.constraint(equalTo: self.topAnchor),
                self.headerView.leftAnchor.constraint(equalTo: self.leftAnchor),
                self.headerView.rightAnchor.constraint(equalTo: self.rightAnchor),
                self.headerView.heightAnchor.constraint(equalToConstant: 20),
                self.headerLabel.topAnchor.constraint(equalTo: self.headerView.topAnchor, constant: 5),
                self.headerLabel.leftAnchor.constraint(equalTo: self.headerView.leftAnchor, constant: 5),
                self.headerLabel.rightAnchor.constraint(equalTo: self.headerView.rightAnchor),
                self.collectionContainerView.leftAnchor.constraint(equalTo: self.leftAnchor),
                self.collectionContainerView.rightAnchor.constraint(equalTo: self.rightAnchor),
                self.collectionContainerView.bottomAnchor.constraint(equalTo: self.seperatorView.topAnchor),
                self.collectionContainerView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor),
                self.seperatorView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                self.seperatorView.leftAnchor.constraint(equalTo: self.leftAnchor),
                self.seperatorView.rightAnchor.constraint(equalTo: self.rightAnchor),
                self.seperatorView.heightAnchor.constraint(equalToConstant: 15),
                self.myCollectionView.topAnchor.constraint(equalTo: self.collectionContainerView.topAnchor, constant: 5),
                self.myCollectionView.leftAnchor.constraint(equalTo: self.collectionContainerView.leftAnchor, constant: 5),
                self.myCollectionView.bottomAnchor.constraint(equalTo: self.collectionContainerView.bottomAnchor, constant: -5),
                self.myCollectionView.rightAnchor.constraint(equalTo: self.collectionContainerView.rightAnchor, constant: -5)
            ])
        }
    }
    
    private func setupCollectionView() {
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(ItemCell.self, forCellWithReuseIdentifier: "sliderCell")
        myCollectionView.contentInsetAdjustmentBehavior = .automatic
    }
}

extension CollectionRowTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "sliderCell", for: indexPath) as! ItemCell
        let image = mockImageData[Int.random(in: 0...2)]
        cell.configure(for: image)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 3, height: myCollectionView.frame.height)
    }
    
}
