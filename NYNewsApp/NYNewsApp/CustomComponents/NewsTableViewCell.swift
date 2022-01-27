//
//  NewsTableViewCell.swift
//  NYNewsApp
//
//  Created by iLeafiMac on 23/01/22.
//

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var byLineLabel: UILabel!
    @IBOutlet weak var dateIconImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    var feedData:ResultList?{
        didSet{
            self.configCell(feedData: feedData)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    fileprivate func configCell(feedData:Any?) {
        
        guard let feed = feedData as? ResultList else { return }
        
        titleLabel?.text = feed.title
        byLineLabel?.text = feed.byline
        dateLabel?.text =  feed.publishedDate
        self.dateIconImageView?.image = #imageLiteral(resourceName: "date_icon")
        if let imageUrlStr = feed.media.first?.mediaMetaData.first?.url {
            let imageUrl = URL(string: imageUrlStr)
            let processor = DownsamplingImageProcessor(size: newsImageView.bounds.size)
                         |> RoundCornerImageProcessor(cornerRadius: 20)
            newsImageView.kf.indicatorType = .activity
            newsImageView.kf.setImage(
                with: imageUrl,
                placeholder: UIImage(named: "place_holder"),
                options: [
                    .processor(processor),
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ])
        }
       // newsImageView.intrinsicContentSize.kf
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
