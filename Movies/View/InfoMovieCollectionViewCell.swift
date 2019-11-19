//
//  InfoMovieCollectionViewCell.swift
//  Movies
//
//  Created by Omar Thamri on 18/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class InfoMovieCollectionViewCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Suits"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let typeLabel: UILabel = {
       let label = UILabel()
        label.text = "2011 - 2019 / 42min / Comedy, Drama, Judicial"
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberOfSeasonLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Number Of Season - 9"
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberOfViewsLabel: UILabel = {
        let label = UILabel()
        label.text = "276 Views"
        label.textColor = UIColor.gray
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 15)
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
       // backgroundColor = UIColor.blue
        addSubview(titleLabel)
        addSubview(typeLabel)
        addSubview(numberOfSeasonLabel)
        addSubview(numberOfViewsLabel)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":titleLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[v0(20)]-20-[v1(15)]-20-[v2(15)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":titleLabel,"v1":typeLabel,"v2":numberOfSeasonLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":typeLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":numberOfSeasonLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views:["v0":numberOfSeasonLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":numberOfViewsLabel]))
        numberOfViewsLabel.bottomAnchor.constraint(equalTo: numberOfSeasonLabel.bottomAnchor).isActive = true
        numberOfViewsLabel.topAnchor.constraint(equalTo: numberOfSeasonLabel.topAnchor).isActive = true
    }
    
}
