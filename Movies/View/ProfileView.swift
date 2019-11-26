//
//  ProfileView.swift
//  Movies
//
//  Created by Omar Thamri on 14/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class ProfileView : UIView, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    var profileImgView : UIImageView = {
        let piv = UIImageView()
        piv.image = UIImage(named: "no-profil")
        piv.contentMode = .scaleToFill
        piv.clipsToBounds = true
        piv.translatesAutoresizingMaskIntoConstraints = false
        return piv
    }()
    
    lazy var cameraImgView: UIImageView = {
        let civ = UIImageView()
        civ.image = UIImage(named: "cameraa")
        civ.tintColor = UIColor.white
        civ.contentMode = .scaleToFill
        civ.clipsToBounds = true
        civ.translatesAutoresizingMaskIntoConstraints = false
        let imgTapped = UITapGestureRecognizer(target: self, action: #selector(cameraImgTapped))
        civ.isUserInteractionEnabled = true
        civ.addGestureRecognizer(imgTapped)
        return civ
    }()
    
    let fullNameLabel: UILabel = {
        let cnl = UILabel()
        cnl.textColor = UIColor.white
        cnl.text = "Full Name"
        cnl.font = UIFont.systemFont(ofSize: 13)
        cnl.translatesAutoresizingMaskIntoConstraints = false
        return cnl
    }()
    
    let fullNameTf: UITextField = {
        let cnl = UITextField()
        cnl.textColor = UIColor.white
        cnl.text = "Omar Thamri"
        cnl.borderStyle = .none
        cnl.font = UIFont.boldSystemFont(ofSize: 15)
        cnl.translatesAutoresizingMaskIntoConstraints = false
        return cnl
    }()
    
    let fullNameView: UIView = {
        let cnv = UIView()
        cnv.backgroundColor = UIColor.init(white: 0.9, alpha: 1)
        cnv.translatesAutoresizingMaskIntoConstraints = false
        return cnv
    }()
    
    let mailLabel: UILabel = {
        let cnl = UILabel()
        cnl.textColor = UIColor.white
        cnl.text = "Email"
        cnl.font = UIFont.systemFont(ofSize: 13)
        cnl.translatesAutoresizingMaskIntoConstraints = false
        return cnl
    }()
    
    let mailTf: UITextField = {
        let cnl = UITextField()
        cnl.textColor = UIColor.white
        cnl.text = "omarthamri@develop.com"
        cnl.borderStyle = .none
        cnl.font = UIFont.boldSystemFont(ofSize: 15)
        cnl.translatesAutoresizingMaskIntoConstraints = false
        return cnl
    }()
    
    let mailView: UIView = {
        let cnv = UIView()
        cnv.backgroundColor = UIColor.init(white: 0.9, alpha: 1)
        cnv.translatesAutoresizingMaskIntoConstraints = false
        return cnv
    }()
    
    let phoneLabel: UILabel = {
        let cnl = UILabel()
        cnl.textColor = UIColor.white
        cnl.text = "Phone Number"
        cnl.font = UIFont.systemFont(ofSize: 13)
        cnl.translatesAutoresizingMaskIntoConstraints = false
        return cnl
    }()
    
    let phoneTf: UITextField = {
        let cnl = UITextField()
        cnl.textColor = UIColor.white
        cnl.text = "53 615 510"
        cnl.borderStyle = .none
        cnl.font = UIFont.boldSystemFont(ofSize: 15)
        cnl.translatesAutoresizingMaskIntoConstraints = false
        return cnl
    }()
    
    let phoneView: UIView = {
        let cnv = UIView()
        cnv.backgroundColor = UIColor.init(white: 0.9, alpha: 1)
        cnv.translatesAutoresizingMaskIntoConstraints = false
        return cnv
    }()
    
    let cityLabel: UILabel = {
        let cnl = UILabel()
        cnl.textColor = UIColor.white
        cnl.text = "City"
        cnl.font = UIFont.systemFont(ofSize: 13)
        cnl.translatesAutoresizingMaskIntoConstraints = false
        return cnl
    }()
    
    let cityTf: UITextField = {
        let cnl = UITextField()
        cnl.textColor = UIColor.white
        cnl.text = "Tunis, Tunisia"
        cnl.borderStyle = .none
        cnl.font = UIFont.boldSystemFont(ofSize: 15)
        cnl.translatesAutoresizingMaskIntoConstraints = false
        return cnl
    }()
    
    let cityView: UIView = {
        let cnv = UIView()
        cnv.backgroundColor = UIColor.init(white: 0.9, alpha: 1)
        cnv.translatesAutoresizingMaskIntoConstraints = false
        return cnv
    }()
    
    let saveChangesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save Changes", for: .normal)
        button.backgroundColor = UIColor.orange
        button.setTitleColor(UIColor.white, for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(saveChangeAction), for: .touchUpInside)
        return button
    }()
    
    lazy var imagePicker: UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = false
        return imagePicker
    }()
    var profileViewController: ProfileViewController?
    var heightValue = 0
    override init(frame: CGRect) {
        super.init(frame: frame)
        heightValue = Int(UIScreen.main.bounds.height - 64)
        setupView()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(profileImgView)
        addSubview(cameraImgView)
        addSubview(fullNameLabel)
        addSubview(fullNameTf)
        addSubview(fullNameView)
        addSubview(mailLabel)
        addSubview(mailTf)
        addSubview(mailView)
        addSubview(phoneLabel)
        addSubview(phoneTf)
        addSubview(phoneView)
        addSubview(cityLabel)
        addSubview(cityTf)
        addSubview(cityView)
        addSubview(saveChangesButton)
        saveChangesButton.layer.cornerRadius = CGFloat(Double(heightValue) * 0.04464)
    }
    
    func setupConstraints() {
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":profileImgView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(\(heightValue / 3))]-\(Double(heightValue) * 0.04464)-[v1(\(Double(heightValue) * 0.02976))]-\(Double(heightValue) * 0.01488)-[v2(\(Double(heightValue) * 0.02976))]-\(Double(heightValue) * 0.00744)-[v3(2)]-\(Double(heightValue) * 0.02976)-[v4(\(Double(heightValue) * 0.02976))]-\(Double(heightValue) * 0.01488)-[v5(\(Double(heightValue) * 0.02976))]-\(Double(heightValue) * 0.00744)-[v6(2)]-\(Double(heightValue) * 0.02976)-[v7(\(Double(heightValue) * 0.02976))]-\(Double(heightValue) * 0.01488)-[v8(\(Double(heightValue) * 0.02976))]-\(Double(heightValue) * 0.00744)-[v9(2)]-\(Double(heightValue) * 0.02976)-[v10(\(Double(heightValue) * 0.02976))]-\(Double(heightValue) * 0.01488)-[v11(\(Double(heightValue) * 0.02976))]-\(Double(heightValue) * 0.00744)-[v12(2)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":profileImgView,"v1":fullNameLabel,"v2":fullNameTf,"v3":fullNameView,"v4":mailLabel,"v5":mailTf,"v6":mailView,"v7":phoneLabel,"v8":phoneTf,"v9":phoneView,"v10":cityLabel,"v11":cityTf,"v12":cityView])) 
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0(30)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":cameraImgView]))
        let distance = ((UIScreen.main.bounds.height - 64) / 3 ) - 55
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(distance)-[v0(30)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":cameraImgView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0(150)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":fullNameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0(150)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":fullNameTf]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":fullNameView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0(150)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":mailLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0(250)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":mailTf]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":mailView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0(150)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":phoneLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0(250)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":phoneTf]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":phoneView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0(150)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":cityLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0(250)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":cityTf]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":cityView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":saveChangesButton]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(\(Double(heightValue) * 0.08928))]-25-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":saveChangesButton]))
        
    }
    
    @objc func cameraImgTapped() {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            profileViewController?.present(imagePicker, animated: true, completion: nil)
            
        }
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        profileViewController?.dismiss(animated: true, completion: { () -> Void in
        })
        profileImgView.image = image
    }
    
    @objc func saveChangeAction() {
        
    }
}
