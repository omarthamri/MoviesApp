//
//  TvCategoryListViewController.swift
//  Movies
//
//  Created by Omar Thamri on 09/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class TvCategoryListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "TV Category"
        view.backgroundColor = UIColor.init(white: 0.2, alpha: 1)
    }
    
    func setupConstraints() {
        
    }
    
    
}
