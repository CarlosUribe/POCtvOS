//
//  Popular.swift
//  POCtvOS
//
//  Created by Carlos Uribe.
//

import Foundation

// MARK: - PopularModel
class PopularModel: Identifiable {
    let page, perPage, totalResults: Int
    let url: String
    let videos: [VideoModel]

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case totalResults = "total_results"
        case url, videos
    }

    init(page: Int, perPage: Int, totalResults: Int, url: String, videos: [VideoModel]) {
        self.page = page
        self.perPage = perPage
        self.totalResults = totalResults
        self.url = url
        self.videos = videos
    }
}
