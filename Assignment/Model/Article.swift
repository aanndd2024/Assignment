//
//  Article.swift
//  Assignment
//
//  Created by Anand Yadav on 20-02-2024.
//

import Foundation

// MARK: - Articles
struct Articles: Decodable {
    var results: [Article]?
}

// MARK: - Article
struct Article: Decodable {
    var title: String?
    var byline: String?
    var abstract: String?
    var publishedDate: String?
    var media: [ArticleMedia]?

    enum CodingKeys: String, CodingKey {
            case title
            case byline
            case abstract
            case publishedDate = "published_date"
            case media
        }
}

// MARK: - ArticleMedia
struct ArticleMedia: Codable {
    var type, subtype, caption, copyright: String?
    var approvedForSyndication: Int?
    var mediaMetadata: [mediaMetadata]?

    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadatum
struct mediaMetadata: Codable {
    var url: String?
    var format: String?
    var height, width: Int?
}
