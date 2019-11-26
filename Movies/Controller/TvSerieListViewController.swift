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
    var selectedItem: Int?
    var leftAnchor: NSLayoutConstraint?
    var rightAnchor: NSLayoutConstraint?
    var logoutTopAnchor: NSLayoutConstraint?
    var alphaViewTopAnchor: NSLayoutConstraint?
    lazy var navDrawerView : NavDrawerView = {
        let ndv = NavDrawerView()
        ndv.translatesAutoresizingMaskIntoConstraints = false
        ndv.tvSerieListViewController = self
        return ndv
    }()
    lazy var closeDrawerView : CloseDrawerView = {
        let ndv = CloseDrawerView()
        ndv.translatesAutoresizingMaskIntoConstraints = false
        let viewTapped = UITapGestureRecognizer(target: self, action: #selector(closeNavDrawer))
        ndv.isUserInteractionEnabled = true
        ndv.addGestureRecognizer(viewTapped)
        return ndv
    }()
    
    var widthNavDrawer: CGFloat?
    var widthCloseNavDrawer: CGFloat?
    
    let currentWindow: UIWindow? = UIApplication.shared.keyWindow
    let alphaView: UIView = {
        let av = UIView()
        av.backgroundColor = UIColor.init(white: 0.5, alpha: 0.5)
        av.translatesAutoresizingMaskIntoConstraints = false
        return av
    }()
    lazy var logoutView: LogoutView = {
        let lv = LogoutView()
        lv.translatesAutoresizingMaskIntoConstraints = false
        lv.tvSerieListViewController = self
        return lv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupNavigationBar()
    }
    
    func setupView() {
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "TV Series"
        view.backgroundColor = UIColor.init(white: 0.2, alpha: 1)
        view.addSubview(tvserieListCV)
        tvserieListCV.register(TvSerieListViewCell.self, forCellWithReuseIdentifier: TvSerieListViewCellId)
        currentWindow?.addSubview(navDrawerView)
        currentWindow?.addSubview(closeDrawerView)
        setupLogoutView()
    }
    
    func setupConstraints() {
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tvserieListCV]))
        if UIDevice().userInterfaceIdiom == .phone {
            if UIScreen.main.nativeBounds.height == 2436 || UIScreen.main.nativeBounds.height == 2688 || UIScreen.main.nativeBounds.height == 1792 {
                view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-94-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tvserieListCV]))
            } else {
                view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-74-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tvserieListCV]))
            }
        }
        
        widthNavDrawer = (currentWindow?.frame.width)! * 2 / 3
        widthCloseNavDrawer = (currentWindow?.frame.width)! / 3
        navDrawerView.widthAnchor.constraint(equalToConstant: widthNavDrawer!).isActive = true
        navDrawerView.heightAnchor.constraint(equalTo: (currentWindow?.heightAnchor)!).isActive = true
        leftAnchor = navDrawerView.leftAnchor.constraint(equalTo: (currentWindow?.leftAnchor)!,constant: -widthNavDrawer!)
        leftAnchor?.isActive = true
        navDrawerView.topAnchor.constraint(equalTo: (currentWindow?.topAnchor)!).isActive = true
        closeDrawerView.widthAnchor.constraint(equalToConstant: widthCloseNavDrawer!).isActive = true
        closeDrawerView.heightAnchor.constraint(equalTo: (currentWindow?.heightAnchor)!).isActive = true
        rightAnchor = closeDrawerView.rightAnchor.constraint(equalTo: (currentWindow?.rightAnchor)!,constant: widthCloseNavDrawer!)
        rightAnchor?.isActive = true
        closeDrawerView.topAnchor.constraint(equalTo: (currentWindow?.topAnchor)!).isActive = true
        setupLogoutViewConstraints()
    }
    
    func setupNavigationBar() {
        let leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(showNavigationDrawer))
        leftBarButtonItem.tintColor = UIColor.white
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search"), style: .plain, target: self, action: #selector(showNavigationDrawer))
        rightBarButtonItem.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc func showNavigationDrawer() {
        UIApplication.shared.keyWindow?.windowLevel = UIWindowLevelStatusBar
        leftAnchor?.constant = 0
        rightAnchor?.constant = 0
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.currentWindow?.layoutIfNeeded()
            self.currentWindow?.updateConstraints()
            self.currentWindow?.setNeedsLayout()
            self.view.layoutIfNeeded()
            self.view.setNeedsLayout()
        })
        
    }
    
    @objc func closeNavDrawer() {
        UIApplication.shared.keyWindow?.windowLevel = UIWindowLevelNormal
        leftAnchor?.constant = -widthNavDrawer!
        rightAnchor?.constant = widthCloseNavDrawer!
        self.currentWindow?.layoutIfNeeded()
        if selectedItem == 0 {
            let homeViewContoller = HomeViewController()
            navigationController?.pushViewController(homeViewContoller, animated: false)
        } else if selectedItem == 1 {
            let moviesViewController = MoviesViewController()
            navigationController?.pushViewController(moviesViewController, animated: false)
        } else if selectedItem == 2 {
            let tvSerieListViewController = TvSerieListViewController()
            navigationController?.pushViewController(tvSerieListViewController, animated: false)
        } else if selectedItem == 3 {
            let favouriteViewController = FavouriteViewController()
            navigationController?.pushViewController(favouriteViewController, animated: false)
        } else if selectedItem == 4 {
            let profileViewController = ProfileViewController()
            navigationController?.pushViewController(profileViewController, animated: false)
        } else if selectedItem == 6 {
            alphaViewTopAnchor?.constant = 0
            logoutTopAnchor?.constant = 0
            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
                self.currentWindow?.layoutIfNeeded()
            })
        }
    }
    
    @objc func searchTapped() {
        
    }
    
    func setupLogoutView() {
        currentWindow?.addSubview(alphaView)
        currentWindow?.addSubview(logoutView)
    }
    
    func setupLogoutViewConstraints() {
        currentWindow?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":alphaView]))
        alphaViewTopAnchor = alphaView.topAnchor.constraint(equalTo: (currentWindow?.topAnchor)!, constant: (currentWindow?.frame.height)!)
        alphaViewTopAnchor?.isActive = true
        alphaView.heightAnchor.constraint(equalTo: (currentWindow?.heightAnchor)!).isActive = true
        currentWindow?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[v0]-30-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":logoutView]))
        logoutView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        logoutTopAnchor = logoutView.centerYAnchor.constraint(equalTo: (currentWindow?.centerYAnchor)!, constant: (currentWindow?.frame.height)! )
        logoutTopAnchor?.isActive = true
    }
    
    func Logout() {
        alphaViewTopAnchor?.constant = (currentWindow?.frame.height)!
        logoutTopAnchor?.constant = (currentWindow?.frame.height)!
        self.currentWindow?.layoutIfNeeded()
        let signInViewController = SignInViewController()
        navigationController?.navigationBar.isHidden = true
        navigationController?.pushViewController(signInViewController, animated: false)
    }
    
    func cancelLogout() {
        alphaViewTopAnchor?.constant = (currentWindow?.frame.height)!
        logoutTopAnchor?.constant = (currentWindow?.frame.height)!
        self.currentWindow?.layoutIfNeeded()
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailMovieViewController = DetailMovieViewController()
        detailMovieViewController.movieTitle = tvseries[indexPath.item].name
        navigationController?.pushViewController(detailMovieViewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width/3) - 10, height: (collectionView.frame.height * 0.38))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    
    
    
}
