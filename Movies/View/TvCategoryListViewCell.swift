//
//  TvCategoryListViewCell.swift
//  Movies
//
//  Created by Omar Thamri on 10/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class TvCategoryListViewCell: UICollectionViewCell {
    
    var tvCategory: Category? {
        didSet {
            if let name = tvCategory?.name  {
                tvCategoryTitle.text = name
            }
            if let imageName = tvCategory?.imageName {
                tvCategoryImg.image = UIImage(named: imageName)
            }
        }
    }
    
    let tvCategoryImg: UIImageView = {
        let nmi = UIImageView()
        nmi.translatesAutoresizingMaskIntoConstraints = false
        nmi.contentMode = .scaleToFill
        nmi.clipsToBounds = true
        nmi.layer.cornerRadius = 10
        return nmi
    }()
    
    let tvCategoryTitle: UILabel = {
        let tcl = UILabel()
        tcl.textColor = UIColor.white
        tcl.textAlignment = .center
        tcl.font = UIFont.boldSystemFont(ofSize: 14)
        tcl.translatesAutoresizingMaskIntoConstraints = false
        return tcl
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
        backgroundColor = UIColor.init(white: 0.2, alpha: 1)
        addSubview(tvCategoryImg)
        addSubview(tvCategoryTitle)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]-9-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tvCategoryImg]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(120)]-3-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tvCategoryImg,"v1":tvCategoryTitle]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]-9-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tvCategoryTitle]))
    }
    
    
    
}
