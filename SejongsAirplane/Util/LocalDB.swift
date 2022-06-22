//
//  LocalDB.swift
//  SejongsAirplane
//
//  Created by wi_seong on 2021/10/02.
//

import Foundation
import UIKit

class LocalDB {
    static let shared = LocalDB()
    
    private let userInfo = UserDefaults.standard
    
    internal func getIamge(_ key: String) -> UIImage{
        if let imgData = UserDefaults.standard.object(forKey: key) as? NSData {
            if let image = UIImage(data: imgData as Data) {
                return image
            }
        }
        return UIImage()
    }
    
    internal func setImage(_ key: String, _ image: UIImage, _ compression: CGFloat) {
        userInfo.setValue(image.jpegData(compressionQuality: compression), forKey: key)
        
    }
    
    internal func getData(_ key: String) -> Any{
        return userInfo.object(forKey: key)!
    }
    
    internal func setData(_ value: Any, _ key: String) {
        userInfo.setValue(value, forKey: key)
    }
}
