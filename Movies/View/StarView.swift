//
//  StarView.swift
//  Movies
//
//  Created by Omar Thamri on 19/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class StarView: UIView {
    
    let firstImgView: UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "star"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let secondImgView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "star"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let thirdImgView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "star"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let fourthImgView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "star"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let fiveImgView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "star"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let loveImgView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "love"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let reportBtn: UIButton = {
       let button = UIButton()
        button.backgroundColor = UIColor.blue
        button.setTitle(NSLocalizedString("Report here", comment: ""), for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        return button
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
        addSubview(firstImgView)
        addSubview(secondImgView)
        addSubview(thirdImgView)
        addSubview(fourthImgView)
        addSubview(fiveImgView)
        addSubview(loveImgView)
        addSubview(reportBtn)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(20)]-5-[v1(20)]-5-[v2(20)]-5-[v3(20)]-5-[v4(20)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":firstImgView,"v1":secondImgView,"v2":thirdImgView,"v3":fourthImgView,"v4":fiveImgView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":firstImgView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":secondImgView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":thirdImgView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":fourthImgView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":fiveImgView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":loveImgView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v1(120)]-20-[v0(40)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":loveImgView,"v1":reportBtn]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":reportBtn]))
    }
}
