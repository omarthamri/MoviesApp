//
//  RelatedMovieViewController.swift
//  Movies
//
//  Created by Omar Thamri on 19/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class RelatedMovieViewController: UIViewController {
    
    let relatedMovieCellId = "relatedMovieCellId"
    var tvseries = [TvSerie(name: "Mad Men",imageName: "mad_men"),TvSerie(name: "Silicon Valley",imageName: "silicon_valley"),TvSerie(name: "Community",imageName: "community")]
    
    lazy var tvserieListCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let tclc = UICollectionView(frame: .zero, collectionViewLayout: layout)
        tclc.delegate = self
        tclc.dataSource = self
        tclc.translatesAutoresizingMaskIntoConstraints = false
        tclc.backgroundColor = UIColor.init(white: 0.2, alpha: 1)
        return tclc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupNavigationBar()
    }
    
    func setupView() {
        view.backgroundColor = UIColor.init(white: 0.2, alpha: 1)
        view.addSubview(tvserieListCV)
        tvserieListCV.register(RelatedMovieListCell.self, forCellWithReuseIdentifier: relatedMovieCellId)
    }
    
    func setupConstraints() {
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tvserieListCV]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-74-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tvserieListCV]))
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "Related TV Series"
        navigationItem.hidesBackButton = true
        let backBarButtonItem = UIBarButtonItem(image: UIImage(named: "backBtn"), style: .plain, target: self, action: #selector(backTapped))
        backBarButtonItem.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = backBarButtonItem
    }
    
    @objc func backTapped() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension RelatedMovieViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tvseries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: relatedMovieCellId, for: indexPath) as! RelatedMovieListCell
        cell.tvSerie = tvseries[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailMovieViewController = DetailMovieViewController()
        detailMovieViewController.movieTitle = tvseries[indexPath.item].name
        navigationController?.pushViewController(detailMovieViewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width/3) - 10, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    
    
    
}

