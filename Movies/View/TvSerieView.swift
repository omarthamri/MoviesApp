//
//  TvSerieView.swift
//  Movies
//
//  Created by Omar Thamri on 08/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class TvSerieView: UIView {
    
    let tvSeriesViewCellId = "tvSeriesViewCellId"
    var tvSeries = [TvSerie(name: "Suits",imageName: "suits"),TvSerie(name: "La casa de papel",imageName: "La_Casa"),TvSerie(name: "Community",imageName: "community")]
    var homeViewController: HomeViewController?
    let tvSerieLbl: UILabel = {
        let tcl = UILabel()
        tcl.text = NSLocalizedString("TV Series", comment: "")
        tcl.textColor = UIColor.white
        tcl.font = UIFont.boldSystemFont(ofSize: 20)
        tcl.translatesAutoresizingMaskIntoConstraints = false
        return tcl
    }()
    
    lazy var viewAllLbl: UIButton = {
        let tcl = UIButton()
        tcl.setTitle(NSLocalizedString("View All", comment: ""), for: .normal)
        tcl.setTitleColor(UIColor.orange, for: .normal)
        tcl.contentHorizontalAlignment = .right
        tcl.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        tcl.translatesAutoresizingMaskIntoConstraints = false
        tcl.addTarget(self, action: #selector(viewAll), for: .touchUpInside)
        return tcl
    }()
    
    lazy var tvSerieCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let tccv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        tccv.translatesAutoresizingMaskIntoConstraints = false
        tccv.delegate = self
        tccv.dataSource = self
        return tccv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        addSubview(tvSerieLbl)
        addSubview(viewAllLbl)
        addSubview(tvSerieCollectionView)
        tvSerieCollectionView.register(TvSerieViewCell.self, forCellWithReuseIdentifier: tvSeriesViewCellId)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tvSerieLbl]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(22)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tvSerieLbl]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":viewAllLbl]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-2-[v0(18)]-10-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":viewAllLbl,"v1":tvSerieCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tvSerieCollectionView]))
    }
    @objc func viewAll() {
        homeViewController?.displayListTvSerie()
    }
    
}

extension TvSerieView: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tvSeries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tvSeriesViewCellId, for: indexPath) as! TvSerieViewCell
        cell.tvSerie = tvSeries[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        homeViewController?.selectedTVSerie = tvSeries[indexPath.item]
        homeViewController?.displayTVSerie()
    }
    
    
}
