//
//  DataProvider.swift
//  POCtvOS
//
//  Created by Carlos Uribe.
//

import SwiftUI

import Foundation

class DataProvider: ObservableObject {
  @Published var itemLists: [PopularModel] = []

  var categoriesWithFavoriteVideos: [PopularModel] {
    return itemLists.filter { item in
      return !item.videos.isEmpty
    }
  }

  var massiveCategoryList: [PopularModel] {
    var list: [PopularModel] = []
      for _ in 0..<100 {
          list.append(contentsOf: self.itemLists)
    }
    return list
  }

  init() {
    itemLists = [
      PopularModel(page: 1, perPage: 1, totalResults: 5, url: "https://www.pexels.com/search/videos/Nature/", videos: [ VideoModel(id: 10, width: 1920, height: 1080, url: "https://player.vimeo.com/external/342571552.hd.mp4?s=6aa6f164de3812abadff3dde86d19f7a074a8a66&profile_id=175&oauth2_token_id=57447761", image: "https://images.pexels.com/videos/1093662/free-video-1093662.jpg?fit=crop&w=1200&h=630&auto=compress&cs=tinysrgb", duration: 8, user: User(id: 1, name: "Peter", url: "https://www.pexels.com/@peter-fowler-417939"), videoFiles: [VideoFile(id: 11, quality: "hd", fileType: "video/mp4", width: 1280, height: 720, link: "https://player.vimeo.com/external/269971860.hd.mp4?s=eae965838585cc8342bb5d5253d06a52b2415570&profile_id=174&oauth2_token_id=57447761")], videoPictures: [])
      ])
    ]
  }
}
