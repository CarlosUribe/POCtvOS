//
//  ItemListProvider.swift
//  POCtvOS
//
//  Created by Carlos Uribe.
//

import SwiftUI

class ItemListProvider: ObservableObject {
  @Published var categories: [PopularModel] = []
  var currentContext: ProviderContext = .general
  var dataProvider: DataProvider

  init(dataProvider: DataProvider) {
    self.dataProvider = dataProvider
  }

  enum ProviderContext: Equatable {
    case general, favorites, search

    var formattedName: String {
      switch self {
      case .general: return "Popular Videos"
      case .favorites: return "Favorites"
      case .search: return "Search"
      }
    }

    var missingCategoriesTitle: String {
      if self == .general || self == .search {
        return "Couldn't find any videos..."
      } else {
        return "No Favorite Videos"
      }
    }

    var missingCategoriesDescription: String {
      if self == .general || self == .search {
        return "No videos or categories were loaded. Has something gone wrong?"
      } else {
        return "You haven't favorited any videos."
      }
    }
  }

  public func refresh() {
    switch currentContext {
    case .general:
        categories = dataProvider.itemLists
    case .search:
      categories = dataProvider.massiveCategoryList
    case .favorites:
      categories = dataProvider.categoriesWithFavoriteVideos
    }
  }
}
