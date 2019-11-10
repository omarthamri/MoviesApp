//
//  NewMoviesCollectionViewCell.swift
//  Movies
//
//  Created by Omar Thamri on 08/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class NewMoviesCollectionViewCell: UICollectionViewCell {
    
    var newMovie: Movie? {
        didSet {
            if let imageName = newMovie?.imageName {
                newMoviesImg.image = UIImage(named: imageName)
            }
        }
    }
    
    let newMoviesImg: UIImageView = {
       let nmi = UIImageView()
        nmi.translatesAutoresizingMaskIntoConstraints = false
        nmi.contentMode = .scaleToFill
        return nmi
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
        backgroundColor = UIColor.init(white:0.2,alpha:1)
        addSubview(newMoviesImg)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":newMoviesImg]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":newMoviesImg]))
    }
    
}
