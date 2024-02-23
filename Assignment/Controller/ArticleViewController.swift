//
//  ViewController.swift
//  Assignment
//
//  Created by Anand Yadav on 20-02-2024.
//

import UIKit
import ProgressHUD

class ArticleViewController: UIViewController, ArticleServices, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var articleTableView: UITableView!
    
    private let viewModel = ArticleViewModel()
    var selectedArticle: Article!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
        setUptableView()
    }
    
    func initViewModel() {
        viewModel.articleDelegate = self
        viewModel.fetchArticles()
    }
    
    func setUptableView() {
        let articleNib = UINib(nibName: "ArticleTableViewCell", bundle: nil)
        self.articleTableView.register(articleNib, forCellReuseIdentifier: "ArticleCellId")
        articleTableView.delegate = self
        ProgressHUD.animate("Loading...")
    }
    
    func reloadData() {
        ProgressHUD.dismiss()
        self.articleTableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let articleCell = tableView.dequeueReusableCell(withIdentifier: "ArticleCellId", for: indexPath) as! ArticleTableViewCell
        articleCell.article = viewModel.articles[indexPath.row]
        return articleCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedArticle = viewModel.articles[indexPath.row]
        performSegue(withIdentifier: "ArticleDetailsViewController", sender: nil)
        self.articleTableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ArticleDetailsViewController" {
            let detailsVC = segue.destination as! ArticleDetailsViewController
            detailsVC.article = selectedArticle
        }
    }
    
}

