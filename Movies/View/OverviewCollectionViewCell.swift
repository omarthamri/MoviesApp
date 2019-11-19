//
//  OverviewCollectionViewCell.swift
//  Movies
//
//  Created by Omar Thamri on 19/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class OverviewCollectionViewCell: UICollectionViewCell {
    
    let overviewLabel: UILabel = {
        let label = UILabel()
        label.text = "Overview"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "A very ambitious lawyer from a big Manhattan firm, Harvey Specter needs someone to support him. His choice is on Mike Ross, a young man very brilliant but without diploma, endowed with a certain talent and a very precious photographic memory. Together, they are a winning team, ready to take on any challenge. Mike, however, will have to use all the tricks to maintain his place without anyone discovering that he has never passed the bar exam."
        label.textColor = UIColor.gray
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
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
        addSubview(overviewLabel)
        addSubview(textLabel)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":overviewLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(20)]-5-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":overviewLabel,"v1":textLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":textLabel]))
    }
    
    
    
}
