//
//  TvCategoryListViewController.swift
//  Movies
//
//  Created by Omar Thamri on 09/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class TvCategoryListViewController: UIViewController {
    
    let TvCategoryListViewCellId = "TvCategoryListViewCellId"
    var tvCategories = [Category(name: "Horror",imageName: "horror"),Category(name: "Action",imageName: "action"),Category(name: "Comedy",imageName: "comedy"),Category(name: "Science Fiction",imageName: "science_fiction"),Category(name: "Drama",imageName: "drama")]
    
    lazy var tvCategoryListCV: UICollectionView = {
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
        navigationItem.title = "TV Categories"
        view.backgroundColor = UIColor.init(white: 0.2, alpha: 1)
        view.addSubview(tvCategoryListCV)
        tvCategoryListCV.register(TvCategoryListViewCell.self, forCellWithReuseIdentifier: TvCategoryListViewCellId)
    }
    
    func setupConstraints() {
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tvCategoryListCV]))
        if UIDevice().userInterfaceIdiom == .phone {
            if UIScreen.main.nativeBounds.height == 2436 || UIScreen.main.nativeBounds.height == 2688 || UIScreen.main.nativeBounds.height == 1792 {
                view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-94-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tvCategoryListCV]))
            } else {
                view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-74-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tvCategoryListCV]))
            }
        }
        
    }
    
    func setupNavigationBar() {
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search"), style: .plain, target: self, action: #selector(searchTapped))
        rightBarButtonItem.tintColor = UIColor.white
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc func searchTapped() {
        
    }
    
    
}

extension TvCategoryListViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tvCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TvCategoryListViewCellId, for: indexPath) as! TvCategoryListViewCell
        cell.tvCategory = tvCategories[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width/3) - 10, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let moviesVC = MoviesViewController()
        moviesVC.titleText = tvCategories[indexPath.item].name
        navigationController?.pushViewController(moviesVC, animated: true)
    }
    
    
}
