//
//  PlayerView.swift
//  POCtvOS
//
//  Created by Carlos Uribe.
//

import SwiftUI
import AVKit

struct PlayerView: View {
    var url: String
    @State private var player: AVQueuePlayer?
    @State private var videoLooper: AVPlayerLooper?

    var body: some View {
      VideoPlayer(player: player)
        .onAppear {
          if player == nil {
            let templateItem = AVPlayerItem(url: URL(string: url)!)
            player = AVQueuePlayer(playerItem: templateItem)
            videoLooper = AVPlayerLooper(player: player!, templateItem: templateItem)
          }

          if player?.isPlaying == false { player?.play() }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct PlayerView_Previews: PreviewProvider {
  static var previews: some View {
    PlayerView(url: "https://player.vimeo.com/external/342571552.hd.mp4?s=6aa6f164de3812abadff3dde86d19f7a074a8a66&profile_id=175&oauth2_token_id=57447761")
  }
}

extension AVPlayer {
    var isPlaying: Bool {
        rate != 0 && error == nil
    }
}

