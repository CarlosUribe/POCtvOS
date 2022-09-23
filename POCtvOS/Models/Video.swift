//
//  Video.swift
//  POCtvOS
//
//  Created by Carlos Uribe.
//

import Foundation

// MARK: - VideoModel
class VideoModel: Identifiable, Equatable, ObservableObject {
    static func == (lhs: VideoModel, rhs: VideoModel) -> Bool {
        lhs.id == rhs.id &&
        lhs.width == rhs.width &&
        lhs.height == rhs.height &&
        lhs.url == rhs.url &&
        lhs.image == rhs.image &&
        lhs.duration == rhs.duration &&
        lhs.user == rhs.user &&
        lhs.videoFiles == rhs.videoFiles &&
        lhs.videoPictures == rhs.videoPictures
    }
    
    let id, width, height: Int
    let url: String
    let image: String
    let duration: Int
    let user: User
    let videoFiles: [VideoFile]
    let videoPictures: [VideoPicture]

    enum CodingKeys: String, CodingKey {
        case id, width, height, url, image, duration, user
        case videoFiles = "video_files"
        case videoPictures = "video_pictures"
    }

    init(id: Int, width: Int, height: Int, url: String, image: String, duration: Int, user: User, videoFiles: [VideoFile], videoPictures: [VideoPicture]) {
        self.id = id
        self.width = width
        self.height = height
        self.url = url
        self.image = image
        self.duration = duration
        self.user = user
        self.videoFiles = videoFiles
        self.videoPictures = videoPictures
    }
}

// MARK: - User
class User: Identifiable, Equatable {
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.url == rhs.url &&
        lhs.name == rhs.name &&
        lhs.url == rhs.url
    }
    
    let id: Int
    let name: String
    let url: String

    init(id: Int, name: String, url: String) {
        self.id = id
        self.name = name
        self.url = url
    }
}

// MARK: - VideoFile
class VideoFile: Identifiable, Equatable {
    static func == (lhs: VideoFile, rhs: VideoFile) -> Bool {
        lhs.id == rhs.id &&
        lhs.quality == rhs.quality &&
        lhs.fileType == rhs.fileType &&
        lhs.width == rhs.width &&
        lhs.height == rhs.height &&
        lhs.link == rhs.link
    }
    
    let id: Int
    let quality, fileType: String
    let width, height: Int?
    let link: String

    enum CodingKeys: String, CodingKey {
        case id, quality
        case fileType = "file_type"
        case width, height, link
    }

    init(id: Int, quality: String, fileType: String, width: Int?, height: Int?, link: String) {
        self.id = id
        self.quality = quality
        self.fileType = fileType
        self.width = width
        self.height = height
        self.link = link
    }
}

// MARK: - VideoPicture
class VideoPicture: Identifiable, Equatable {
    static func == (lhs: VideoPicture, rhs: VideoPicture) -> Bool {
        lhs.id == rhs.id &&
        lhs.picture == rhs.picture &&
        lhs.nr == rhs.nr
    }
    
    let id: Int
    let picture: String
    let nr: Int

    init(id: Int, picture: String, nr: Int) {
        self.id = id
        self.picture = picture
        self.nr = nr
    }
}
