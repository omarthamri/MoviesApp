//
//  DetailMovieViewController.swift
//  Movies
//
//  Created by Omar Thamri on 17/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class DetailMovieViewController: UIViewController {
    
    let detailMovieCellId = "detailMovieCellId"
    var movieTitle : String?
    lazy var detailMovieCV : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
       let dmcv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        dmcv.translatesAutoresizingMaskIntoConstraints = false
        dmcv.delegate = self
        dmcv.dataSource = self
        dmcv.backgroundColor = UIColor.init(white: 0.2, alpha: 1)
        return dmcv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupNavigationBar()
    }
    
    func setupView() {
        view.backgroundColor = UIColor.init(white: 0.2, alpha: 1)
        view.addSubview(detailMovieCV)
        detailMovieCV.register(VideoPlayerCollectionViewCell.self, forCellWithReuseIdentifier: detailMovieCellId)
    }
    
    func setupConstraints() {
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":detailMovieCV]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-64-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":detailMovieCV]))
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = movieTitle
    }
    
    
}

extension DetailMovieViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailMovieCellId, for: indexPath) as! VideoPlayerCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.width * 9 / 16)
    }
    
    
}
