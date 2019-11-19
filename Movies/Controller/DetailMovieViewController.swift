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
    let InfoMovieCellId = "InfoMovieCellId"
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
        detailMovieCV.register(InfoMovieCollectionViewCell.self, forCellWithReuseIdentifier: InfoMovieCellId)
    }
    
    func setupConstraints() {
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":detailMovieCV]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-64-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":detailMovieCV]))
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = movieTitle
        navigationItem.hidesBackButton = true
        let backBarButtonItem = UIBarButtonItem(image: UIImage(named: "backBtn"), style: .plain, target: self, action: #selector(backTapped))
        backBarButtonItem.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = backBarButtonItem
    }
    
    @objc func backTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    
}

extension DetailMovieViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoMovieCellId, for: indexPath) as! InfoMovieCollectionViewCell
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailMovieCellId, for: indexPath) as! VideoPlayerCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 1 {
            return CGSize(width: collectionView.frame.width, height: 190)
        }
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.width * 9 / 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}
