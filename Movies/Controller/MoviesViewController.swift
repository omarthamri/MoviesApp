//
//  MoviesViewController.swift
//  Movies
//
//  Created by Omar Thamri on 13/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupNavigationBar()
    }
    
    func setupView() {
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "Movies"
        view.backgroundColor = UIColor.init(white: 0.2, alpha: 1)
    }
    
    func setupConstraints() {
        
    }
    
    func setupNavigationBar() {
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search"), style: .plain, target: self, action: #selector(searchTapped))
        rightBarButtonItem.tintColor = UIColor.white
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc func searchTapped() {
        
    }
    
    
}
