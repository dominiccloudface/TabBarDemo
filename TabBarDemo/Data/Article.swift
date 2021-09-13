//
//  Article.swift
//  TabBarDemo
//
//  Created by Dominic Wood on 10/09/2021.
//

import Foundation

struct Article: Codable, Hashable {
    var title: String
    var description: String
    var url: String
    var firstImageUrl: String?
    var headlineImageUrl: String?
    var backgroundImageUrl: String?
    var newsKeywords: String?

    var instruments: [String]
    var tags: [String]
    var categories: [String]
}

struct ArticleResponse: Codable, Hashable {
    let topNews: [Article]
}
