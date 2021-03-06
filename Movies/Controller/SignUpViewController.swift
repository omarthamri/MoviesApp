//
//  SignUpViewController.swift
//  Movies
//
//  Created by Omar Thamri on 20/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Movies"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let fullNameTf: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("Full Name", comment: ""),
                                                      attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        tf.borderStyle = .none
        tf.textAlignment = .center
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let mailTf: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Email",
                                                      attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        tf.borderStyle = .none
        tf.textAlignment = .center
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let phoneTf: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("Phone Number", comment: ""),
                                                      attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        tf.borderStyle = .none
        tf.textAlignment = .center
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let passwordTf: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("Password", comment: ""),
                                                      attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        tf.borderStyle = .none
        tf.textAlignment = .center
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let fullNameTfLine: TextFieldLineView = {
        let view = TextFieldLineView(frame: .zero)
        return view
    }()
    
    let phoneTfLine: TextFieldLineView = {
        let view = TextFieldLineView(frame: .zero)
        return view
    }()
    
    let mailTfLine: TextFieldLineView = {
        let view = TextFieldLineView(frame: .zero)
        return view
    }()
    
    let passwordTfLine: TextFieldLineView = {
        let view = TextFieldLineView(frame: .zero)
        return view
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle(NSLocalizedString("Sign Up", comment: ""), for: .normal)
        button.backgroundColor = UIColor.orange
        button.setTitleColor(UIColor.white, for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
        return button
    }()
    
    lazy var SignInLabel: UILabel = {
        let label = UILabel()
        label.text = "\(NSLocalizedString("Already a Member?", comment: "")) \(NSLocalizedString("Sign In", comment: ""))"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        let labelTapped = UITapGestureRecognizer(target: self, action: #selector(signInAction))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(labelTapped)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    @objc func signUpAction() {
        saveUser()
    }
    
    @objc func signInAction() {
        let signInViewController = SignInViewController()
        navigationController?.pushViewController(signInViewController, animated: true)
    }
    
    func saveUser() {
       
    }
    
    func setupView() {
        view.backgroundColor = UIColor.init(white: 0.2 , alpha: 1)
        view.addSubview(titleLabel)
        view.addSubview(mailTf)
        view.addSubview(mailTfLine)
        view.addSubview(passwordTf)
        view.addSubview(passwordTfLine)
        view.addSubview(fullNameTf)
        view.addSubview(fullNameTfLine)
        view.addSubview(phoneTf)
        view.addSubview(phoneTfLine)
        view.addSubview(signUpButton)
        view.addSubview(SignInLabel)
        signUpButton.layer.cornerRadius = view.frame.height * 0.04076
    }
    
    func setupConstraints() {
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":titleLabel]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(view.frame.height / 6.5)-[v0(36)]-\(view.frame.height * 0.09)-[v1(44)]-0.1-[v2(1)]-\(view.frame.height * 0.04076)-[v3(44)]-0.1-[v4(1)]-\(view.frame.height * 0.04076)-[v5(44)]-0.1-[v6(1)]-\(view.frame.height * 0.04076)-[v7(44)]-0.1-[v8(1)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":titleLabel,"v1" : fullNameTf,"v2" : fullNameTfLine,"v3":mailTf,"v4":mailTfLine,"v5":phoneTf,"v6":phoneTfLine,"v7":passwordTf,"v8":passwordTfLine]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":mailTf]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":mailTfLine]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":passwordTf]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":passwordTfLine]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":fullNameTf]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":fullNameTfLine]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":phoneTf]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":phoneTfLine]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":signUpButton]))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(\(view.frame.height * 0.08152))]-\(view.frame.height * 0.03396)-[v1(\(view.frame.height * 0.04076))]-\(view.frame.height * 0.08152)-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": signUpButton,"v1":SignInLabel]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":SignInLabel]))
    }
    
}
