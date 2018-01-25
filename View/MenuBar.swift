//
//  MenuBar.swift
//  AcuDragon
//
//  Created by Emiko Clark on 1/23/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionview : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    let cellId = "cellId"
    let menuImages = ["dragon.png","dragon.png","dragon.png","dragon.png"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        collectionview.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        addSubview(collectionview)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionview)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionview)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = CGSize(width: frame.size.width/4, height: frame.size.height)
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        
        if indexPath.row == 0 {
            cell.menuImageView.image = UIImage(named: menuImages[indexPath.row])
        }
        
        return cell
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MenuCell : UICollectionViewCell {
    
    let menuImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "dragon.png")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupMenuCell()
    }
    
    func setupMenuCell() {
        addSubview(menuImageView)

        // add constraint
        addConstraintsWithFormat(format: "H:[v0(40)]", views: menuImageView)
        addConstraintsWithFormat(format: "V:[v0(40)]", views: menuImageView)
        
        addConstraint(NSLayoutConstraint(item: menuImageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX , multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: menuImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY , multiplier: 1, constant: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
