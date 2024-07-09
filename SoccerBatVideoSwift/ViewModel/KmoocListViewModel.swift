//
//  KmoocListViewModel.swift
//  KmoocSwift
//
//  Created by 박성영 on 2021/09/10.
//
//
import Foundation


class KmoocListViewModel {
    
    var listUpdate : () -> Void = { }
    
    var classesList : ClassList!
    var isListUp = false //현재 listup중인지 확인하는 flag
    
    func classesCount() -> Int {
        if let classesList = classesList{
            return classesList.classes.count
        }
        return 0
    }
    
    func listUP() {
        if isListUp{
            return
        }
        isListUp = true
        var pageNum = 1
        if let classesList = classesList {
            pageNum = classesList.lastPageNum + 1
        }
        
        
        
//        JsonManager.shared.getJson(pageNum: pageNum) { [weak self] (result) in
//            if let list = self?.classesList{ //처음 listup이 아니면 기존 모델과 합침
//                let classes = list.classes + result.classes
//                self?.classesList.classes = classes
//                self?.classesList.lastPageNum = result.lastPageNum
//            }
//            else{
//                self?.classesList = result
//            }
//            self?.listUpdate()
//            self?.isListUp = false
//        }
        
    }
    
    //index에 있는 class 모델 
    func indexClass(indexPath : IndexPath) -> Class? {
//        print(classesList.classes[indexPath.row])
//        print(classesList.classes[indexPath.row]?.class_image.image["raw"])
        return classesList.classes[indexPath.row]
    }
    
}
