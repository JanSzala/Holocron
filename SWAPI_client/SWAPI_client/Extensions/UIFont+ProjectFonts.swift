//
//  UIFont+ProjectFonts.swift
//  SWAPI_client
//
//  Created by JanSzala on 25/03/2019.
//  Copyright © 2019 JanSzala. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    static let DINCondensedNameBold = "DINCondensed-Bold"
    
    static func font(name fontName: String, size fontSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: fontName, size: fontSize) else {
            return UIFont.systemFont(ofSize: fontSize)
        }
        
        return font
    }
    
    static func dinCondensedBold(ofSize size: CGFloat) -> UIFont {
        return UIFont.font(name: DINCondensedNameBold, size: size)
    }    
}
