//
//  NewsDetailViewController.swift
//  NYNewsApp
//
//  Created by iLeafiMac on 23/01/22.
//

import UIKit
import Kingfisher
class NewsDetailViewController: UIViewController {
    @IBOutlet weak var newsDetailLabel: UILabel!
    @IBOutlet weak var newsDetailImage: UIImageView!
    var viewModel:NewsDetailViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    func initView(){
        newsDetailLabel.text = viewModel?.newsData?.abstract
        loadNewsImage()
    }
    
    func loadNewsImage(){
        if let imageUrlStr = viewModel?.newsData?.media.first?.mediaMetaData[1].url {
            let imageUrl = URL(string: imageUrlStr)
            newsDetailImage.kf.indicatorType = .activity
            newsDetailImage.kf.setImage(
                with: imageUrl,
                placeholder: UIImage(named: "place_holder"),
                options: [
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ])
        }
    }
}
