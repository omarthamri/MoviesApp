//
//  NewMoviesView.swift
//  Movies
//
//  Created by Omar Thamri on 08/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class NewMoviesView: UIView {
    
    let newMoviesCellId = "newMoviesCellId"
    
    lazy var newMoviesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let nmcv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        nmcv.dataSource = self
        nmcv.delegate = self
        nmcv.translatesAutoresizingMaskIntoConstraints = false
        nmcv.isPagingEnabled = true
        return nmcv
    }()
    
    let pagecontrol : UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
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
        backgroundColor = UIColor.blue
        addSubview(newMoviesCollectionView)
        newMoviesCollectionView.register(NewMoviesCollectionViewCell.self, forCellWithReuseIdentifier: newMoviesCellId)
        addSubview(pagecontrol)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":newMoviesCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":newMoviesCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":pagecontrol]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0]-4-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":pagecontrol]))
    }
    
    
}

extension NewMoviesView: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: newMoviesCellId, for: indexPath) as! NewMoviesCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        pagecontrol.currentPage = Int(targetContentOffset.pointee.x / frame.width)
    }
    
    
    
    
    
}
