//
//  ViewController.swift
//  Movies
//
//  Created by Omar Thamri on 06/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let newMoviesView: NewMoviesView = {
        let nmv = NewMoviesView()
        nmv.translatesAutoresizingMaskIntoConstraints = false
        return nmv
    }()
    
    lazy var tvCategoryView: TvCategoryView = {
       let tcv = TvCategoryView()
        tcv.homeViewController = self
        tcv.translatesAutoresizingMaskIntoConstraints = false
        return tcv
    }()
    
    lazy var tvSerieView: TvSerieView = {
        let tcv = TvSerieView()
        tcv.translatesAutoresizingMaskIntoConstraints = false
        tcv.homeViewController = self
        return tcv
    }()
    var selectedItem: Int?
    var leftAnchor: NSLayoutConstraint?
    var rightAnchor: NSLayoutConstraint?
    var logoutTopAnchor: NSLayoutConstraint?
    var alphaViewTopAnchor: NSLayoutConstraint?
    var selectedCategoryName: String?
    var selectedTVSerie: TvSerie?
    lazy var navDrawerView : NavDrawerView = {
        let ndv = NavDrawerView()
        ndv.translatesAutoresizingMaskIntoConstraints = false
        ndv.homeViewController = self
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
        lv.homeViewController = self
        return lv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupNavigationBar()
    }
    
    func setupView() {
        view.backgroundColor = UIColor.init(white:0.2,alpha:1)
        view.addSubview(newMoviesView)
        view.addSubview(tvCategoryView)
        view.addSubview(tvSerieView)
        currentWindow?.addSubview(navDrawerView)
        currentWindow?.addSubview(closeDrawerView)
        setupLogoutView()
    }

    func setupConstraints() {
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":newMoviesView]))
        if UIDevice().userInterfaceIdiom == .phone {
            if UIScreen.main.nativeBounds.height == 2436 || UIScreen.main.nativeBounds.height == 2688 || UIScreen.main.nativeBounds.height == 1792 {
                
                view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(view.frame.height * 0.12771)-[v0(\(view.frame.height * 0.33967))]-\(view.frame.height * 0.02038)-[v1(\(view.frame.height * 0.23097))]-\(view.frame.height * 0.02038)-[v2(\(view.frame.height * 0.23097))]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":newMoviesView,"v1":tvCategoryView,"v2":tvSerieView]))
            } else {
                view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(view.frame.height * 0.10054)-[v0(\(view.frame.height * 0.33967))]-\(view.frame.height * 0.02038)-[v1(\(view.frame.height * 0.23097))]-\(view.frame.height * 0.02038)-[v2(\(view.frame.height * 0.23097))]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":newMoviesView,"v1":tvCategoryView,"v2":tvSerieView]))
            }
        }
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tvCategoryView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tvSerieView]))
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
        navigationItem.title = NSLocalizedString("Home", comment: "")
         navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.barTintColor = UIColor.init(white:0.2,alpha:1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
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
        } else if selectedItem == 5 {
            let settingsViewController = SettingsViewController()
            navigationController?.pushViewController(settingsViewController, animated: false)
        } else if selectedItem == 6 {
            alphaViewTopAnchor?.constant = 0
            logoutTopAnchor?.constant = 0
            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
                self.currentWindow?.layoutIfNeeded()
            })
        }
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
    
    func displayListTvCategory() {
        let tvCategoryListViewController = TvCategoryListViewController()
        navigationController?.pushViewController(tvCategoryListViewController, animated: true)
    }
    
    func displayListTvSerie() {
        let tvSerieListViewController = TvSerieListViewController()
        navigationController?.pushViewController(tvSerieListViewController, animated: true)
    }
    
    func displayTvCategory() {
        let moviesVC = MoviesViewController()
        moviesVC.titleText = selectedCategoryName
        navigationController?.pushViewController(moviesVC, animated: true)
    }
    
    func displayTVSerie() {
        let detailMovieViewController = DetailMovieViewController()
        detailMovieViewController.movieTitle = selectedTVSerie?.name
        navigationController?.pushViewController(detailMovieViewController, animated: true)
    }

}

