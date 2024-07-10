//
//  JsonManager.swift
//  KmoocSwift
//
//  Created by 박성영 on 2021/09/09.
//

import Foundation
import RxSwift

class JsonManager {

    static let shared = JsonManager()

    let decoder = JSONDecoder()
    
    let myToken = "MTY4NTcxXzE3MjA1MzYzMTFfNGU5NDZiYjhmOTAxNThkYzlkODczM2M2MjQzNjU0MTMwODEyZmQ0Zg=="
    let apiURL = "https://www.scorebat.com/video-api/v3/feed"
    
    func getJson() -> Observable<[FeedData?]> {
        return Observable.create { [weak self] observer in
            if let URL = URL(string: (self?.apiURL ?? "") + "/?token=\(self?.myToken ?? "")") {
                URLSession.shared.dataTask(with: URL) { data, response, error in
                    if let data = data {
                        do {
                            let object = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                            guard let jsonObject = object else { return }
                            if let res = jsonObject["response"] as? [[String : Any]]{
                                let classes = res.map {
                                    self?.getClass(data: try? JSONSerialization.data(withJSONObject: $0, options: .prettyPrinted))
                                }
                                
                                print("success",URL)
                                print(classes.count)
                                observer.onNext(classes)
                                observer.onCompleted()
                            }
                        }
                        catch {
                            print("error",URL)
                        }
                    }
                }.resume()
            }
            return Disposables.create()
        }
        
        
    }
    
    func getClass(data : Data?) -> FeedData? {
        if let data = data {
            return try? decoder.decode(FeedData.self, from: data)
        }
        else{
            return nil
        }
    }
}
