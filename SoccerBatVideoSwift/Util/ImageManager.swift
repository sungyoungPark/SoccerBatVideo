//
//  ImageManager.swift
//  KmoocSwift
//
//  Created by 박성영 on 2021/09/10.
//

import UIKit


class ImageManager {
    
    static let shared = ImageManager()
    
    func setImage(link : String, size : CGSize, completion : @escaping (UIImage?) -> Void) {
        
        guard let url = URL(string: link) else  {
            return
        }
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    completion(image?.resized(to: size))
                }
            }
            catch{
                print("image error")
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
        
    }
    

}

extension UIImage {
    func resized(to size: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
