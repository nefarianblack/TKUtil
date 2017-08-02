//
//  UIImageView+TKUtil.swift
//  TKUtil Example
//
//  Created by Tanmay Khandelwal on 02/08/17.
//  Copyright © 2017 Tanmay Khandelwal. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloaded(fromURL url: URL) {
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200 else { return }
            
            guard let mimeType = httpURLResponse.mimeType, mimeType.hasPrefix("image") else { return }
            
            guard let data = data, error == nil, let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async(execute: {
                self.image = image
            })
        }).resume()
    }
    
    func downloaded(fromURL url: URL, placeholder: UIImage) {
        self.image = placeholder
        downloaded(fromURL: url)
    }
    
    func downloaded(fromLink link: String) {
        guard let url = URL(string: link) else { return }
        downloaded(fromURL: url)
    }
    
    func downloaded(fromLink link: String, placeholder: UIImage) {
        self.image = placeholder
        guard let url = URL(string: link) else { return }
        downloaded(fromURL: url)
    }
}
