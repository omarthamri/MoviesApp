//
//  TvSerieListViewController.swift
//  Movies
//
//  Created by Omar Thamri on 10/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class TvSerieListViewController: UIViewController {
    
    let TvSerieListViewCellId = "TvSerieListViewCellId"
    var tvseries = [TvSerie(name: "Suits",imageName: "suits"),TvSerie(name: "La casa de papel",imageName: "La_Casa"),TvSerie(name: "Community",imageName: "community"),TvSerie(name: "Vikings",imageName: "vikings"),TvSerie(name: "Mad Men",imageName: "mad_men"),TvSerie(name: "Silicon Valley",imageName: "silicon_valley"),TvSerie(name: "Game Of Thrones",imageName: "Game_of_Thrones"),TvSerie(name: "How I Met Your Mother",imageName: "himym"),TvSerie(name: "Big Bang Theory",imageName: "big_bang_theory")]
    
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
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "TV Serie"
        view.backgroundColor = UIColor.init(white: 0.2, alpha: 1)
        view.addSubview(tvserieListCV)
        tvserieListCV.register(TvSerieListViewCell.self, forCellWithReuseIdentifier: TvSerieListViewCellId)
    }
    
    func setupConstraints() {
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tvserieListCV]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-74-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tvserieListCV]))
    }
    
    func setupNavigationBar() {
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search"), style: .plain, target: self, action: #selector(searchTapped))
        rightBarButtonItem.tintColor = UIColor.white
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc func searchTapped() {
        
    }
    
    
}

extension TvSerieListViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tvseries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TvSerieListViewCellId, for: indexPath) as! TvSerieListViewCell
        cell.tvSerie = tvseries[indexPath.item]
        return cell
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
