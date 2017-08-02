//
//  URL+TKUtil.swift
//  TKUtil Example
//
//  Created by Tanmay Khandelwal on 02/08/17.
//  Copyright © 2017 Tanmay Khandelwal. All rights reserved.
//

import Foundation

extension URL {
    static func documentsDirectoryURL() -> URL? {
        if let directoryPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            return directoryPath
        }
        
        return nil
    }
    
    func value(forParam param: String) -> String? {
        if let queryItems = URLComponents(url: self, resolvingAgainstBaseURL: false)?.queryItems {
            if let item = (queryItems.filter { $0.name == param }).first {
                return item.value
            }
        }
        
        return nil
    }
}
