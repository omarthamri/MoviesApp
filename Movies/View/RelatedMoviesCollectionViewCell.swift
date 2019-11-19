//
//  RelatedMoviesCollectionViewCell.swift
//  Movies
//
//  Created by Omar Thamri on 19/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class RelatedMoviesCollectionViewCell: UICollectionViewCell {
    
    let relatedMoviesLabel: UILabel = {
        let label = UILabel()
        label.text = "Related TV Series"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var viewAllBtn: UIButton = {
        let tcl = UIButton()
        tcl.setTitle("View All", for: .normal)
        tcl.setTitleColor(UIColor.orange, for: .normal)
        tcl.contentHorizontalAlignment = .right
        tcl.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
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
        addSubview(relatedMoviesLabel)
        addSubview(viewAllBtn)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":relatedMoviesLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0(20)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":relatedMoviesLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0(20)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":viewAllBtn]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":viewAllBtn]))
    }
    
}
