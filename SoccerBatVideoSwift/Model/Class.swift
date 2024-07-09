//
//  Class.swift
//  KmoocSwift
//
//  Created by 박성영 on 2021/09/10.
//

import Foundation


struct Class : Codable {
//    var thumbnailImage : String
    var name : String
    var org_name : String
    var course_id : String
    var class_image : ClassImage
    
    enum CodingKeys : String, CodingKey {
        case name, org_name, course_id
        case class_image =  "media"
    }
}

struct ClassImage : Codable {
    var image : [String:String]
}
