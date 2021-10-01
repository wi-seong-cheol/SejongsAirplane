//
//  UIBarButtonItem + Extension.swift
//  SejongsAirplane
//
//  Created by wi_seong on 2021/10/01.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    class func BackButton() -> UIBarButtonItem {
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .black
        return backBarButtonItem
    }
}
