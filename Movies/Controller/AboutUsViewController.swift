//
//  AboutUsViewController.swift
//  Movies
//
//  Created by Omar Thamri on 28/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {
    
    lazy var aboutUsCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let aucv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        aucv.translatesAutoresizingMaskIntoConstraints = false
        aucv.delegate = self
        aucv.dataSource = self
        aucv.backgroundColor = UIColor.init(white: 0.2, alpha: 1)
        return aucv
    }()
    let aboutUsMenuItems = [MenuItem(title: "Version",information: "1.0.0",imageName: "version"),MenuItem(title: NSLocalizedString("Developer", comment: ""),information: "Omar Thamri",imageName: "developer"),MenuItem(title: "Email",information: "omarthamri4@gmail.com",imageName: "email"),MenuItem(title: NSLocalizedString("Website", comment: ""),information: "www.omarthamri.ml",imageName: "website"),MenuItem(title: "Contact",information: "+21653615510",imageName: "contact")]
    let aboutUsCellId = "aboutUsCellId"
    let aboutUSCVCellId = "aboutUSCVCellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupNavigationBar()
    }
    
    func setupView() {
        view.backgroundColor = UIColor.init(white: 0.2, alpha: 1)
        view.addSubview(aboutUsCV)
        aboutUsCV.register(AboutUsCVCell.self, forCellWithReuseIdentifier: aboutUSCVCellId)
        aboutUsCV.register(AboutUsCell.self, forCellWithReuseIdentifier: aboutUsCellId)
    }
    
    func setupConstraints() {
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":aboutUsCV]))
        if UIScreen.main.nativeBounds.height == 2436 || UIScreen.main.nativeBounds.height == 2688 || UIScreen.main.nativeBounds.height == 1792 {
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-106-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":aboutUsCV]))
        } else {
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-84-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":aboutUsCV]))
        }
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = NSLocalizedString("About us", comment: "")
        navigationItem.hidesBackButton = true
        let backBarButtonItem = UIBarButtonItem(image: UIImage(named: "backBtn"), style: .plain, target: self, action: #selector(backTapped))
        backBarButtonItem.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = backBarButtonItem
    }
    
    @objc func backTapped() {
        navigationController?.popViewController(animated: true)
    }
    
}


extension AboutUsViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 5 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: aboutUSCVCellId, for: indexPath) as! AboutUsCVCell
            cell.backgroundColor = UIColor.white
            cell.layer.cornerRadius = 5
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: aboutUsCellId, for: indexPath) as! AboutUsCell
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 5
        cell.menuItem = aboutUsMenuItems[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 5 {
            return CGSize(width: collectionView.frame.width - 20, height: collectionView.frame.height * 1.8 / 7)
        }
        return CGSize(width: collectionView.frame.width - 20, height: collectionView.frame.height / 7)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    
}
