//
//  ArticleViewModel.swift
//  Assignment
//
//  Created by Anand Yadav on 20-02-2024.
//

import Foundation

protocol ArticleServices: AnyObject {
    func reloadData() // Data Binding - PROTOCOL (View and ViewModel Communication)
}

class ArticleViewModel {
    var articles: [Article] = [] {
        didSet {
            self.articleDelegate?.reloadData()
        }
    }
    private var manager = APIManager()
    weak var articleDelegate: ArticleServices?
    
    // @MainActor -> DispatchQueue.Main.async
    @MainActor func fetchArticles() {
        Task { // @MainActor in
            do {
                let articleResponseArray: Articles = try await manager.getArticles()
                print(articleResponseArray)
                self.articles = articleResponseArray.results!
            }catch {
                debugPrint(error)
            }
        }
    }
}
