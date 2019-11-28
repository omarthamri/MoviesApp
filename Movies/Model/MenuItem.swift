//
//  MenuItem.swift
//  Movies
//
//  Created by Omar Thamri on 28/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit


class MenuItem: NSObject {
    
    var title: String?
    var information: String?
    var imageName: String?
    
    init(title: String?,information: String?,imageName: String?) {
        self.title = title
        self.information = information
        self.imageName = imageName
    }
    
}
