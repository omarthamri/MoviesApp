//
//  MoviesListViewCell.swift
//  Movies
//
//  Created by Omar Thamri on 13/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class MoviesListViewCell: UICollectionViewCell {
    
    var movie: Movie? {
        didSet {
            if let name = movie?.name  {
                movieTitle.text = name
            }
            if let imageName = movie?.imageName {
                movieImg.image = UIImage(named: imageName)
            }
        }
    }
    
    let movieImg: UIImageView = {
        let nmi = UIImageView()
        nmi.translatesAutoresizingMaskIntoConstraints = false
        nmi.contentMode = .scaleToFill
        nmi.clipsToBounds = true
        nmi.layer.cornerRadius = 10
        return nmi
    }()
    
    let movieTitle: UILabel = {
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
        addSubview(movieImg)
        addSubview(movieTitle)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]-9-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":movieImg]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(\(frame.height * 0.88))]-3-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":movieImg,"v1":movieTitle]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]-9-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":movieTitle]))
    }
    
    
    
}


