//
//  ArticleDetailsViewController.swift
//  Assignment
//
//  Created by Anand Yadav on 21-02-2024.
//

import UIKit

class ArticleDetailsViewController: UIViewController {

    @IBOutlet weak var imgViewArticle: UIImageView!
    @IBOutlet weak var lblArticleTitle: UILabel!
    @IBOutlet weak var lblArticleSubTitle: UILabel!
    
    var article: Article!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        lblArticleTitle.text = article.title
        lblArticleSubTitle.text = article.byline
        if let imageUrl = article.media?.first?.mediaMetadata?.last?.url {
            imgViewArticle.kf.setImage(with: URL(string:imageUrl))
        }
    }
}
