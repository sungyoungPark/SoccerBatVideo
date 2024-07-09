//
//  ClassList.swift
//  KmoocSwift
//
//  Created by 박성영 on 2021/09/10.
//

import Foundation


struct ClassList : Codable {
    
    var lastPageNum : Int  //불러온 마지막 페이지
    var classes : [Class?]
    

    init(lastPageNum  : Int ,classes : [Class?]) {
        self.lastPageNum = lastPageNum
        self.classes = classes
        
        
    }

}
