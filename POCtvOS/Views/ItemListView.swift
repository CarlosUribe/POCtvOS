//
//  ItemListView.swift
//  POCtvOS
//
//  Created by Carlos Uribe.
//

import SwiftUI

struct ItemListView: View {
    @ObservedObject var itemList: ItemListProvider
    var listContext: ItemListProvider.ProviderContext
    
    init(listContext: ItemListProvider.ProviderContext, dataProvider: DataProvider) {
      self.listContext = listContext

      self.itemList = ItemListProvider(dataProvider: dataProvider)
      self.itemList.currentContext = listContext
    }
    
    var body: some View {
      Group {
        ScrollView(.vertical, showsIndicators: false) {
          if itemList.categories.isEmpty {
            VStack {
              Text(listContext.missingCategoriesTitle)
                .font(.title2)
                .bold()
                .foregroundColor(Color.primary)
              Text(listContext.missingCategoriesDescription)
                .font(.title3)
                .foregroundColor(Color.secondary)
            }.padding()
          } else {
            LazyVStack(alignment: .leading) {
              ForEach(itemList.categories) { list in
                ListRow(
                  popular: list
                )
              }
              .animation(.default, value: 1)
            }
          }
        }
      }
      .navigationTitle(listContext.formattedName)
      .onAppear {
        itemList.refresh()
      }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView(listContext: .general, dataProvider: DataProvider())
    }
}
