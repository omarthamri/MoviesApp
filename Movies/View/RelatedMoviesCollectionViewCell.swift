//
//  RelatedMoviesCollectionViewCell.swift
//  Movies
//
//  Created by Omar Thamri on 19/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class RelatedMoviesCollectionViewCell: UICollectionViewCell {
    
    let relatedMoviesCellId = "relatedMoviesCellId"
    var detailMovieViewController: DetailMovieViewController?
    var tvSeries = [TvSerie(name: "Mad Men",imageName: "mad_men"),TvSerie(name: "Silicon Valley",imageName: "silicon_valley"),TvSerie(name: "Community",imageName: "community")]
    let relatedMoviesLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("Related TV Series", comment: "")
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var viewAllBtn: UIButton = {
        let tcl = UIButton()
        tcl.setTitle(NSLocalizedString("View All", comment: ""), for: .normal)
        tcl.setTitleColor(UIColor.orange, for: .normal)
        tcl.contentHorizontalAlignment = .right
        tcl.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        tcl.translatesAutoresizingMaskIntoConstraints = false
        tcl.addTarget(self, action: #selector(viewAllTapped), for: .touchUpInside)
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
        addSubview(relatedMoviesLabel)
        addSubview(viewAllBtn)
        addSubview(tvSerieCollectionView)
        tvSerieCollectionView.register(RelatedMovieCell.self, forCellWithReuseIdentifier: relatedMoviesCellId)
    }
    
    @objc func viewAllTapped() {
        detailMovieViewController?.diplayRelatedMovies()
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":relatedMoviesLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0(20)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":relatedMoviesLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0(20)]-20-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":viewAllBtn,"v1":tvSerieCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":viewAllBtn]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tvSerieCollectionView]))
    }
    
}

extension RelatedMoviesCollectionViewCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tvSeries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: relatedMoviesCellId, for: indexPath) as! RelatedMovieCell
        cell.tvSerie = tvSeries[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}
