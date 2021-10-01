//
//  Fonts + Exstension.swift
//  SejongsAirplane
//
//  Created by wi_seong on 2021/10/01.
//

import UIKit

extension UIFont {
    class func MyriadPro(type: MyriadProType, size: CGFloat) -> UIFont! {
        let name = "MyriadPro"
        guard let font = UIFont(name: name + type.name, size: size) else {
            print("Do not Font")
            return nil
        }
        return font
    }
    
    enum MyriadProType {
        case regular
        case bold
        
        var name: String {
            switch self {
            case .regular:
                return "-Regular"
            case .bold:
                return "-Bold"
            }
        }
    }
}
