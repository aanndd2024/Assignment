//
//  ArticleTableViewCell.swift
//  Assignment
//
//  Created by Anand Yadav on 21-02-2024.
//

import UIKit
import Kingfisher

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgViewArticle: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubLine: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    var article: Article! {
        didSet {
            lblTitle.text = article.title
            lblSubLine.text = article.byline
            lblDate.text = article.publishedDate
            if let imageUrl = article.media?.first?.mediaMetadata?.first?.url {
                imgViewArticle.kf.setImage(with: URL(string:imageUrl))
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
