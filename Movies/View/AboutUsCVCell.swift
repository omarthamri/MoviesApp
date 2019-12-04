//
//  AboutUsCVCell.swift
//  Movies
//
//  Created by Omar Thamri on 28/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class AboutUsCVCell: UICollectionViewCell {
    
    let aboutLbl: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = NSLocalizedString("About", comment: "")
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let detailTView: UITextView = {
       let textview = UITextView()
        textview.text = NSLocalizedString("AboutDescription", comment: "")
        textview.textColor = UIColor.black
        textview.font = UIFont.systemFont(ofSize: 16)
        textview.translatesAutoresizingMaskIntoConstraints = false
        return textview
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
        addSubview(aboutLbl)
        addSubview(detailTView)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":aboutLbl]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[v0(18)]-10-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":aboutLbl,"v1":detailTView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":detailTView]))
    }
    
}
