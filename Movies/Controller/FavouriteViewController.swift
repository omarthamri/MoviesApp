//
//  FavouriteViewController.swift
//  Movies
//
//  Created by Omar Thamri on 14/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class FavouriteViewController: UIViewController {
    
    var selectedItem: Int?
    var leftAnchor: NSLayoutConstraint?
    var rightAnchor: NSLayoutConstraint?
    var logoutTopAnchor: NSLayoutConstraint?
    var alphaViewTopAnchor: NSLayoutConstraint?
    lazy var navDrawerView : NavDrawerView = {
        let ndv = NavDrawerView()
        ndv.translatesAutoresizingMaskIntoConstraints = false
        ndv.favouriteViewController = self
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
    
    let choiceView: UIView = {
        let cv = UIView()
        cv.backgroundColor = UIColor.init(white: 0.25, alpha: 1)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let moviesBtn: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("Movies", for: .normal)
        mb.setTitleColor(UIColor.white, for: .normal)
        mb.titleLabel?.textAlignment = .center
        return mb
    }()
    
    let tvSeriesBtn: UIButton = {
        let mb = UIButton()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setTitle("TV Serie", for: .normal)
        mb.setTitleColor(UIColor.white, for: .normal)
        mb.titleLabel?.textAlignment = .center
        return mb
    }()
    
    let whiteLine: UIView = {
       let wl = UIView()
        wl.backgroundColor = UIColor.white
        wl.translatesAutoresizingMaskIntoConstraints = false
        return wl
    }()
    
    let TvSerieWhiteLine: UIView = {
        let wl = UIView()
        wl.backgroundColor = UIColor.white
        wl.translatesAutoresizingMaskIntoConstraints = false
        wl.isHidden = true
        return wl
    }()
    
    var widthNavDrawer: CGFloat?
    var widthCloseNavDrawer: CGFloat?
    
    let currentWindow: UIWindow? = UIApplication.shared.keyWindow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupNavigationBar()
    }
    
    func setupView() {
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "Favorite"
        view.backgroundColor = UIColor.init(white: 0.2, alpha: 1)
        currentWindow?.addSubview(navDrawerView)
        currentWindow?.addSubview(closeDrawerView)
        view.addSubview(choiceView)
        choiceView.addSubview(moviesBtn)
        choiceView.addSubview(whiteLine)
        choiceView.addSubview(tvSeriesBtn)
        choiceView.addSubview(TvSerieWhiteLine)
    }
    
    func setupConstraints() {
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":choiceView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-64-[v0(75)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":choiceView]))
        choiceView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(\(view.frame.width/2))]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":moviesBtn]))
        choiceView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]-1-[v1(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":moviesBtn,"v1":whiteLine]))
        choiceView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(\(view.frame.width/2))]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":whiteLine]))
        choiceView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(\(view.frame.width/2))]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tvSeriesBtn]))
        choiceView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]-1-[v1(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tvSeriesBtn,"v1":TvSerieWhiteLine]))
        choiceView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(\(view.frame.width/2))]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":TvSerieWhiteLine]))
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
    }
    
    func setupNavigationBar() {
        let leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(showNavigationDrawer))
        leftBarButtonItem.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = leftBarButtonItem
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
        }else if selectedItem == 4 {
            let profileViewController = ProfileViewController()
            navigationController?.pushViewController(profileViewController, animated: false)
        }
    }
    
}
