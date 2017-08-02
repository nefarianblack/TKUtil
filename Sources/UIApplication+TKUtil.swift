//
//  UIApplication+TKUtil.swift
//  TKUtil Example
//
//  Created by Tanmay Khandelwal on 02/08/17.
//  Copyright © 2017 Tanmay Khandelwal. All rights reserved.
//

import UIKit

public extension UIApplication {
    func openSettingsApp() {
        guard let url = URL(string: UIApplicationOpenSettingsURLString) else {
            return
        }
        
        open(url,
             options: [UIApplicationOpenURLOptionUniversalLinksOnly: NSNumber(booleanLiteral: true)],
             completionHandler: nil)
    }
    
    func open(urlString: String, completionHandler: ((Bool) -> Swift.Void)?) {
        guard let url = URL(string: urlString), canOpenURL(url) else {
            completionHandler?(false)
            return
        }
        
        open(url, options: [:]) { (success: Bool) in
            completionHandler?(success)
        }
    }
}
