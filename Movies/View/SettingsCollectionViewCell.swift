//
//  SettingsCollectionViewCell.swift
//  Movies
//
//  Created by Omar Thamri on 27/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class SettingsCollectionViewCell: UICollectionViewCell {
    
    let settingNameLbl: UILabel = {
       let snl = UILabel()
        snl.textColor = UIColor.white
        snl.translatesAutoresizingMaskIntoConstraints = false
        snl.font = UIFont.boldSystemFont(ofSize: 20)
        return snl
    }()
    
    let nextImg: UIImageView = {
       let ni = UIImageView()
        ni.translatesAutoresizingMaskIntoConstraints = false
        ni.image = UIImage(named: "next")
        ni.contentMode = .scaleToFill
        ni.clipsToBounds = true
        ni.tintColor = UIColor.white
        return ni
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
        addSubview(settingNameLbl)
        addSubview(nextImg)
    }
    
    func setupConstraints() {
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0(\(frame.width / 2))]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":settingNameLbl]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":settingNameLbl]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(20)]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":nextImg]))
        nextImg.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nextImg.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    
    
    
}
