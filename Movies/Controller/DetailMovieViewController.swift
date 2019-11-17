//
//  DetailMovieViewController.swift
//  Movies
//
//  Created by Omar Thamri on 17/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class DetailMovieViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupNavigationBar()
    }
    
    func setupView() {
        view.backgroundColor = UIColor.init(white: 0.2, alpha: 1)
    }
    
    func setupConstraints() {
        
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "Limitless"
    }
    
    
}
