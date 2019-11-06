//
//  ViewController.swift
//  Movies
//
//  Created by Omar Thamri on 06/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let trendingView: UIView = {
        let tv = UIView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupNavigationBar()
    }
    
    func setupView() {
        view.backgroundColor = UIColor.init(white:0.2,alpha:1)
    }

    func setupConstraints() {
        
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

