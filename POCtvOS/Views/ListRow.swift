//
//  ListRow.swift
//  POCtvOS
//
//  Created by Carlos Uribe.
//

import SwiftUI

struct ListRow: View {
    var popular: PopularModel

    var body: some View {
        Text("Popular Videos")
            .font(.headline)
            .bold()
        
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .top) {
                ForEach(popular.videos) { videoItem in
                    NavigationLink(destination: VideoItemDetailView(popular: popular, video: videoItem)) {
                        VideoItemView(video: videoItem)
                            .frame(maxWidth: 460)
                            .cornerRadius(8)
                            .padding()
                    }
                    .buttonStyle(.card)
                }
            }
        }.padding()
    }
}
