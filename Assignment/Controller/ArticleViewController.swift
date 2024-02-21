//
//  ViewController.swift
//  Assignment
//
//  Created by Anand Yadav on 20-02-2024.
//

import UIKit

class ViewController: UIViewController, ArticleServices {
    private let viewModel = ArticleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
        // Do any additional setup after loading the view.
    }
    
    func initViewModel() {
        viewModel.articleDelegate = self
        viewModel.fetchArticles()
    }
    
    func reloadData() {
        
    }


}

