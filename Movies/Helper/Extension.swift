//
//  Extension.swift
//  Movies
//
//  Created by Omar Thamri on 28/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

extension UIView {
    func addConstraintsWithFormat(format: String,views: UIView...) {
        
        var viewDictionnary = [String: UIView]()
        for (index,view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewDictionnary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewDictionnary))
        
    }
}
