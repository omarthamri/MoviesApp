//
//  ContactUsView.swift
//  Movies
//
//  Created by Omar Thamri on 01/12/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class ContactUsView: UIView {
    
    
    let sendmessageLbl: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Send a Message"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
       return label
    }()
    let nameTf: UITextField = {
       let textfield = UITextField()
        textfield.placeholder = " Your Name..."
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor.init(white: 0.9, alpha: 1).cgColor
        textfield.clipsToBounds = true
        textfield.layer.cornerRadius = 5
        return textfield
    }()
    let emailTf: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = " Your Email..."
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor.init(white: 0.9, alpha: 1).cgColor
        textfield.clipsToBounds = true
        textfield.layer.cornerRadius = 5
        return textfield
    }()
    let messageTf: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = " Your Message..."
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor.init(white: 0.9, alpha: 1).cgColor
        textfield.clipsToBounds = true
        textfield.layer.cornerRadius = 12.5
        return textfield
    }()
    lazy var sendBtn: UIButton = {
        let button = UIButton()
        button.setTitle("SEND IT", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.init(white: 0.2, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 7
        button.addTarget(self, action: #selector(sendBtnTapped), for: .touchUpInside)
        return button
    }()
    
    var settingsViewController: SettingsViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(sendBtn)
        addSubview(sendmessageLbl)
        addSubview(nameTf)
        addSubview(emailTf)
        addSubview(messageTf)
    }
    
    func setupConstraints() {
        addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: sendBtn)
        addConstraintsWithFormat(format: "V:[v0(40)]-20-|", views: sendBtn)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":sendmessageLbl]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[v0(22)]-15-[v1(40)]-15-[v2(40)]-15-[v3(100)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":sendmessageLbl,"v1":nameTf,"v2":emailTf,"v3":messageTf]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":nameTf]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":emailTf]))
         addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":messageTf]))
        
    }
    
    @objc func sendBtnTapped() {
        settingsViewController?.closeContactUs()
    }
    
}
