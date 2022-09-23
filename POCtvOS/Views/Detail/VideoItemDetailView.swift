//
//  VideoItemDetailView.swift
//  POCtvOS
//
//  Created by Carlos Uribe.
//

import SwiftUI

struct VideoItemDetailView: View {
  @State var popular: PopularModel
  @ObservedObject var video: VideoModel

  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      HStack(alignment: .top, spacing: 40) {
        VStack(alignment: .leading) {
            Image(video.image)
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fill)
            .frame(width: 675, height: 382)
            .clipped()
            .cornerRadius(10)
            .shadow(radius: 5)
          Text("Video")
            .font(Font.title3)
            .bold()
            Text(video.user.name)
            .foregroundColor(Color.secondary)
            .font(Font.headline)

          Divider()

          HStack(spacing: 40) {
              NavigationLink(destination: PlayerView(url: video.url)) {
              Image(systemName: "play")
            }
          }.padding(.bottom, 50)
        }.padding()
      }
    }
  }
}
