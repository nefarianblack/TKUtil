//
//  String+TKUtil.swift
//  TKUtil Example
//
//  Created by Tanmay Khandelwal on 02/08/17.
//  Copyright © 2017 Tanmay Khandelwal. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func value(fromParam param: String) -> String? {
        if let queryItems = NSURLComponents(string: self)?.queryItems {
            if let item = (queryItems.filter { $0.name == param }).first {
                return item.value
            }
        }
        
        return nil
    }
}
