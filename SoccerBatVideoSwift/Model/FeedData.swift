//
//  FeedData.swift
//  KmoocSwift
//
//  Created by 박성영 on 7/9/24.
//
//참고 : https://www.scorebat.com/account/
// https://www.scorebat.com/video-api/v3/feed/?token=MTY4NTcxXzE3MjA1MzYzMTFfNGU5NDZiYjhmOTAxNThkYzlkODczM2M2MjQzNjU0MTMwODEyZmQ0Zg==

import Foundation

struct FeedData : Codable {
    
    var title : String
    var competition : String
    var matchviewUrl : String
    var thumbnail : String
  
    
    enum CodingKeys : String, CodingKey {
        case title, competition, matchviewUrl, thumbnail
    }
    
}
