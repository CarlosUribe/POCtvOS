//
//  VideoItemView.swift
//  POCtvOS
//
//  Created by Carlos Uribe.
//

import SwiftUI

struct VideoItemView: View {
    
    var video: VideoModel
    @Environment(\.isFocused) var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            asyncImage
                .frame(width: 450, height: 255)
                .clipped()
                .cornerRadius(8)
                .shadow(radius: 2)
            
            VStack(alignment: .leading) {
                Text("Video")
                    .foregroundColor(.primary)
                    .font(.headline)
                    .bold()
            }
        }
    }
    
    private var asyncImage: some View  {
        AsyncImage(url: URL(string: video.image)) { phase in
            switch phase {
            case .empty:
                HStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
                
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
            case .failure:
                HStack {
                    Spacer()
                    Image(systemName: "photo")
                        .imageScale(.large)
                    Spacer()
                }
                
                
            @unknown default:
                fatalError()
            }
        }
    }
}

struct VideoItemView_Previews: PreviewProvider {
    static var previews: some View {
        VideoItemView(video: VideoModel(id: 0, width: 1080, height: 1920, url: "https://www.pexels.com/video/2499611/", image: "https://images.pexels.com/videos/2499611/free-video-2499611.jpg?fit=crop&w=1200&h=630&auto=compress&cs=tinysrgb", duration: 22, user: User(id: 680589, name: "Joey Farina", url: "https://www.pexels.com/@joey"), videoFiles: [], videoPictures: []))
    }
}


