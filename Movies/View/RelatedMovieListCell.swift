//
//  RelatedMovieListCell.swift
//  Movies
//
//  Created by Omar Thamri on 19/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class RelatedMovieListCell : UICollectionViewCell {
    
    var tvSerie: TvSerie? {
        didSet {
            if let name = tvSerie?.name  {
                tvSerieTitle.text = name
            }
            if let imageName = tvSerie?.imageName {
                tvSerieImg.image = UIImage(named: imageName)
            }
        }
    }
    
    let tvSerieImg: UIImageView = {
        let nmi = UIImageView()
        nmi.translatesAutoresizingMaskIntoConstraints = false
        nmi.contentMode = .scaleToFill
        nmi.clipsToBounds = true
        nmi.layer.cornerRadius = 10
        return nmi
    }()
    
    let tvSerieTitle: UILabel = {
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
        addSubview(tvSerieImg)
        addSubview(tvSerieTitle)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]-9-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tvSerieImg]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(\(frame.height * 0.88))]-3-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tvSerieImg,"v1":tvSerieTitle]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]-9-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tvSerieTitle]))
    }
    
    
    
}

