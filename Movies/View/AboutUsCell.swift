//
//  AboutUsCell.swift
//  Movies
//
//  Created by Omar Thamri on 28/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit


class AboutUsCell: UICollectionViewCell {
    
    var menuItem: MenuItem? {
        didSet {
            if let title = menuItem?.title {
                titleLbl.text = title
            }
            if let information = menuItem?.information {
                infoLbl.text = information
            }
            if let imageName = menuItem?.imageName {
                image.image = UIImage(named: imageName)
            }
        }
    }
    
    let image: UIImageView = {
       let img = UIImageView()
        img.contentMode = .scaleToFill
        img.tintColor = UIColor.gray
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let titleLbl: UILabel = {
       let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let infoLbl: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        addSubview(image)
        addSubview(titleLbl)
        addSubview(infoLbl)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0(45)]-10-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":image,"v1":titleLbl]))
        image.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        image.heightAnchor.constraint(equalToConstant: 45).isActive = true
        titleLbl.topAnchor.constraint(equalTo: image.topAnchor).isActive = true
        titleLbl.heightAnchor.constraint(equalToConstant: 18).isActive = true
        infoLbl.leftAnchor.constraint(equalTo: image.rightAnchor,constant: 10).isActive = true
        infoLbl.widthAnchor.constraint(equalTo: titleLbl.widthAnchor, multiplier: 1).isActive = true
        infoLbl.heightAnchor.constraint(equalToConstant: 16).isActive = true
        infoLbl.bottomAnchor.constraint(equalTo: image.bottomAnchor).isActive = true
    }
    
    
}
