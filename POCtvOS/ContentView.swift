//
//  ContentView.swift
//  POCtvOS
//
//  Created by Carlos Uribe.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var dataProvider = DataProvider()
    
    var body: some View {
        NavigationView {
            TabView {
                ItemListView(listContext: .general, dataProvider: dataProvider)
                .tabItem {
                        Label("Videos", systemImage: "video")
                    }
                .tag("videos")
                
                ItemListView(listContext: .favorites, dataProvider: dataProvider)
                    .tabItem {
                        Label("Favorites", systemImage: "bookmark")
                    }
                    .tag("favorites")
                
                Text("Search for images")
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                    .tag("search")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
