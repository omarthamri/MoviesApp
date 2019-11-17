//
//  VideoPlayerCollectionView.swift
//  Movies
//
//  Created by Omar Thamri on 17/11/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit
import AVFoundation

class VideoPlayerCollectionView: UICollectionViewCell {
    
    var player: AVPlayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = UIColor.black
        let urlString = "http://localhost/suits.mp4"
        if let url = URL(string: urlString) {
            player = AVPlayer(url: url)
            let playerLayer = AVPlayerLayer(player: player)
            self.layer.addSublayer(playerLayer)
            playerLayer.frame = self.frame
            player?.play()
        }
    }
    
}
