//
//  PrivacyPolicyViewController.swift
//  Movies
//
//  Created by Omar Thamri on 29/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class PrivacyPolicyViewController: UIViewController {
    
    let whiteView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    
    let privacyPolicyTV: UITextView = {
       let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
       let attributedText = NSMutableAttributedString(string: "We are commited to protecting your privacy \n \n We collect the minimum amount of information about you to be able to provide you with a satisfiying service. Your use of our iOS application gives us the right to collect these informations. \n \n Information collected \n \n We may collect any or all the informations that you give us including your name,email address and telephone number together with the data you use on our mobile application. \n \n Information use \n \n We use the informations collected primarly to process the task for which you use our iOS application. All reasonable precautions are taken to prevent unauthorized access to this information.")
        let selectedRange = NSMakeRange(0, 42 );
        let secandRange = NSMakeRange(43, 198);
        let thirdRange = NSMakeRange(242, 22);
        let fourthRange = NSMakeRange(265, 175);
        let fithrange = NSMakeRange(441, 22);
        let sixthrange = NSMakeRange(464, attributedText.length - 465);
    attributedText.addAttributes([NSAttributedStringKey.foregroundColor:UIColor.black,NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 20)], range: selectedRange)
    attributedText.addAttributes([NSAttributedStringKey.foregroundColor:UIColor.black,NSAttributedStringKey.font:UIFont.systemFont(ofSize: 16)], range: secandRange)

   attributedText.addAttributes([NSAttributedStringKey.foregroundColor:UIColor.black,NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 20)], range: thirdRange)
    attributedText.addAttributes([NSAttributedStringKey.foregroundColor:UIColor.black,NSAttributedStringKey.font:UIFont.systemFont(ofSize: 16)], range: fourthRange)
    attributedText.addAttributes([NSAttributedStringKey.foregroundColor:UIColor.black,NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 20)], range: fithrange)
    attributedText.addAttributes([NSAttributedStringKey.foregroundColor:UIColor.black,NSAttributedStringKey.font:UIFont.systemFont(ofSize: 16)], range: sixthrange)
        textView.attributedText = attributedText
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupNavigationBar()
    }
    
    func setupView() {
        view.backgroundColor = UIColor.init(white: 0.2, alpha: 1)
        view.addSubview(whiteView)
        whiteView.addSubview(privacyPolicyTV)
    }
    
    func setupConstraints() {
        view.addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: whiteView)
        if UIScreen.main.nativeBounds.height == 2436 || UIScreen.main.nativeBounds.height == 2688 || UIScreen.main.nativeBounds.height == 1792 {
        view.addConstraintsWithFormat(format: "V:|-106-[v0]-20-|", views: whiteView)
        } else {
            view.addConstraintsWithFormat(format: "V:|-84-[v0]-20-|", views: whiteView)
        }
        whiteView.addConstraintsWithFormat(format: "H:|[v0]|", views: privacyPolicyTV)
        whiteView.addConstraintsWithFormat(format: "V:|[v0]|", views: privacyPolicyTV)
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "Privacy Policy"
        navigationItem.hidesBackButton = true
        let backBarButtonItem = UIBarButtonItem(image: UIImage(named: "backBtn"), style: .plain, target: self, action: #selector(backTapped))
        backBarButtonItem.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = backBarButtonItem
    }
    
    @objc func backTapped() {
        navigationController?.popViewController(animated: true)
    }
    
}
