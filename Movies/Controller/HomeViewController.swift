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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupNavigationBar()
    }
    
    func setupView() {
        view.backgroundColor = UIColor.init(white:0.2,alpha:1)
        view.addSubview(newMoviesView)
    }

    func setupConstraints() {
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":newMoviesView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-74-[v0(250)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":newMoviesView]))
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

