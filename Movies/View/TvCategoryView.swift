//
//  TvCategoryView.swift
//  Movies
//
//  Created by Omar Thamri on 08/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class TvCategoryView: UIView {
    
    let tvCategoryViewCellId = "tvCategoryViewCellId"
    var tvCategories = [Category(name: "Horror",imageName: "horror"),Category(name: "Action",imageName: "action"),Category(name: "Comedy",imageName: "comedy")]
    
    let tvCategoryLbl: UILabel = {
       let tcl = UILabel()
        tcl.text = "TV Categories"
        tcl.textColor = UIColor.white
        tcl.font = UIFont.boldSystemFont(ofSize: 20)
        tcl.translatesAutoresizingMaskIntoConstraints = false
        return tcl
    }()
    
    let viewAllLbl: UILabel = {
        let tcl = UILabel()
        tcl.text = "View All"
        tcl.textColor = UIColor.orange
        tcl.textAlignment = .right
        tcl.font = UIFont.boldSystemFont(ofSize: 16)
        tcl.translatesAutoresizingMaskIntoConstraints = false
        return tcl
    }()
    
    lazy var tvCategoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
       let tccv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        tccv.translatesAutoresizingMaskIntoConstraints = false
        tccv.delegate = self
        tccv.dataSource = self
        return tccv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        addSubview(tvCategoryLbl)
        addSubview(viewAllLbl)
        addSubview(tvCategoryCollectionView)
        tvCategoryCollectionView.register(TvCategoryViewCell.self, forCellWithReuseIdentifier: tvCategoryViewCellId)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tvCategoryLbl]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(22)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tvCategoryLbl]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":viewAllLbl]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-2-[v0(18)]-10-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":viewAllLbl,"v1":tvCategoryCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tvCategoryCollectionView]))
    }
    
    
}

extension TvCategoryView: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tvCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tvCategoryViewCellId, for: indexPath) as! TvCategoryViewCell
        cell.tvCategory = tvCategories[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}
