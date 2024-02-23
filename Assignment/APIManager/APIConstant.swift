//
//  APIConstant.swift
//  Assignment
//
//  Created by Anand Yadav on 20-02-2024.
//

import Foundation

enum ArticlesPeriod: Int {
    case day = 1
    case week = 7
    case month = 30
}

let apiKey = ProcessInfo.processInfo.environment["NYTIMES_API_KEY"] ?? ""

let baseURL = "https://api.nytimes.com/svc"
let section = "all-sections"
let apiMostPopularArticles = "/mostpopular/v2/mostviewed/\(section)/\(ArticlesPeriod.week.rawValue).json"


