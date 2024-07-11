//
//  FeedData.swift
//  KmoocSwift
//
//  Created by 박성영 on 7/9/24.
//
//참고 : https://www.scorebat.com/account/
// https://www.scorebat.com/video-api/v3/feed/?token=MTY4NTcxXzE3MjA1MzYzMTFfNGU5NDZiYjhmOTAxNThkYzlkODczM2M2MjQzNjU0MTMwODEyZmQ0Zg==

import Foundation

struct videos : Codable {
    let embed : String
}

struct FeedData : Codable, Hashable, Equatable {
    
    var uuid = UUID()
    var title : String
    var competition : String
    var matchviewUrl : String
    var thumbnail : String
    let videos : [videos]
    
    
    enum CodingKeys : String, CodingKey {
        case title, competition, matchviewUrl, thumbnail, videos
    }
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        title = try values.decode(String.self, forKey: .title)
//        competition = try values.decode(String.self, forKey: .competition)
//        matchviewUrl = try values.decode(String.self, forKey: .matchviewUrl)
//        thumbnail = try values.decode(String.self, forKey: .thumbnail)
//        
//        let videoValues = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .videos)
//        
//        //embed = try videoValues.decode(String.self, forKey: .embed)
//    }
//    
//    func encode(to encoder: any Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(title, forKey: .title)
//        try container.encode(competition, forKey: .competition)
//        try container.encode(matchviewUrl, forKey: .matchviewUrl)
//        try container.encode(thumbnail, forKey: .thumbnail)
//        
//        var videoContainer = container.nestedContainer(keyedBy: CodingKeys.self, forKey: .videos)
//        //try videoContainer.encode(embed, forKey: .embed)
//        
//    }
    
}

extension FeedData {
    
    static func == (lhs: FeedData, rhs: FeedData) -> Bool {
        return lhs.uuid == rhs.uuid
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
    
}
