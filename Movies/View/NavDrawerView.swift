//
//  NavDrawerView.swift
//  Movies
//
//  Created by Omar Thamri on 09/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class NavDrawerView: UIView {
    
    let navDrawerCvId = "navDrawerCvId"
    var homeViewController: HomeViewController?
    var moviesViewController: MoviesViewController?
    var tvSerieListViewController: TvSerieListViewController?
    var profileViewController: ProfileViewController?
    var favouriteViewController: FavouriteViewController?
    var settingsViewController: SettingsViewController?
    let menuItems = [Menu(name: NSLocalizedString("Home", comment: ""),imageName: "home"),Menu(name: NSLocalizedString("Movies", comment: ""),imageName: "movies"),Menu(name: NSLocalizedString("TV Series", comment: ""),imageName: "tvseries"),Menu(name: NSLocalizedString("Favorite", comment: ""),imageName: "favorite"),Menu(name: NSLocalizedString("Profile", comment: ""),imageName: "account"),Menu(name: NSLocalizedString("Settings", comment: ""),imageName: "setting"),Menu(name: NSLocalizedString("Logout", comment: ""),imageName: "logout")]
    
    var headerView: UIView = {
        var hv = UIView()
        hv.backgroundColor = UIColor.init(white: 0.2, alpha: 1)
        hv.translatesAutoresizingMaskIntoConstraints = false
        return hv
    }()
    
    let profileImgView: UIImageView = {
        let piv = UIImageView()
        piv.image = UIImage(named: "no-profil")
        piv.contentMode = .scaleToFill
        piv.clipsToBounds = true
        piv.layer.cornerRadius = 30
        piv.translatesAutoresizingMaskIntoConstraints = false
        return piv
    }()
    
    let nameLabel: UILabel = {
        let nl = UILabel()
        nl.text = "Omar Thamri"
        nl.textColor = UIColor.white
        nl.font = UIFont.boldSystemFont(ofSize: 16)
        nl.translatesAutoresizingMaskIntoConstraints = false
        return nl
    }()
    
    let mailLabel: UILabel = {
        let nl = UILabel()
        nl.text = "omarthamri@develop.com"
        nl.textColor = UIColor.white
        nl.font = UIFont.systemFont(ofSize: 14)
        nl.translatesAutoresizingMaskIntoConstraints = false
        return nl
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = UIColor.white
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
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
        backgroundColor = UIColor.white
        addSubview(headerView)
        headerView.addSubview(profileImgView)
        headerView.addSubview(nameLabel)
        headerView.addSubview(mailLabel)
        collectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: navDrawerCvId)
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":headerView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(176)]-10-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":headerView,"v1":collectionView]))
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[v0(60)]-10-[v1(20)]-10-[v2(20)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":profileImgView,"v1":nameLabel,"v2":mailLabel]))
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0(60)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":profileImgView]))
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0(150)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":nameLabel]))
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0(200)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":mailLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":collectionView]))
    }
    
}

extension NavDrawerView: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: navDrawerCvId, for: indexPath) as! MenuCollectionViewCell
        cell.menu = menuItems[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: frame.height * 0.06793)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if homeViewController != nil {
            homeViewController?.selectedItem = indexPath.item
            homeViewController?.closeNavDrawer()
        } else if moviesViewController != nil { 
            moviesViewController?.selectedItem = indexPath.item
            moviesViewController?.closeNavDrawer()
        } else if tvSerieListViewController != nil {
            tvSerieListViewController?.selectedItem = indexPath.item
            tvSerieListViewController?.closeNavDrawer()
        } else if profileViewController != nil {
            profileViewController?.selectedItem = indexPath.item
            profileViewController?.closeNavDrawer()
        } else if favouriteViewController != nil {
            favouriteViewController?.selectedItem = indexPath.item
            favouriteViewController?.closeNavDrawer()
        } else if settingsViewController != nil {
            settingsViewController?.selectedItem = indexPath.item
            settingsViewController?.closeNavDrawer()
        }
    }
    
}
