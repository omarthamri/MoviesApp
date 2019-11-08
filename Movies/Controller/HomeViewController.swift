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
    
    let tvCategoryView: TvCategoryView = {
       let tcv = TvCategoryView()
        tcv.translatesAutoresizingMaskIntoConstraints = false
        return tcv
    }()
    
    let tvSerieView: TvSerieView = {
        let tcv = TvSerieView()
        tcv.translatesAutoresizingMaskIntoConstraints = false
        return tcv
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
    }

    func setupConstraints() {
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":newMoviesView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-74-[v0(250)]-10-[v1(170)]-10-[v2(170)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":newMoviesView,"v1":tvCategoryView,"v2":tvSerieView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tvCategoryView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tvSerieView]))
    }
    
    func setupNavigationBar() {
        navigationItem.title = "Home"
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
        
    }

}

