//
//  NewsModel.swift
//  GetNewsMVVM
//
//  Created by emre usul on 22.01.2023.
//

import Foundation

struct NewsModel: Codable {
    let articles: [Article]?
}

struct Article: Codable {
    let title: String?
    let description: String?
    let content: String?
    let urlToImage: String?
}




