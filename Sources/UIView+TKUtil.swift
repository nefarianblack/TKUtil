//
//  UIView+TKUtil.swift
//  TKUtil Example
//
//  Created by Tanmay Khandelwal on 02/08/17.
//  Copyright © 2017 Tanmay Khandelwal. All rights reserved.
//

import UIKit

// MARK:- Animations

extension UIView {
    func presentWithForwardAnimation() {
        self.alpha = 0
        self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(withDuration: 0.3) {
            self.transform = .identity
            self.alpha = 1
        }
    }
    
    func dismissWithBackwardAnimation() {
        self.alpha = 1
        UIView.animate(withDuration: 0.3, animations: {
            self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            self.alpha = 0
        }, completion: { (completed) in
            self.transform = .identity
        })
    }
}

// MARK:- IBDesignable

@IBDesignable extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        get {
            return UIColor(cgColor: layer.shadowColor!)
        }
        set {
            layer.shadowColor = newValue?.cgColor
            layer.masksToBounds = false
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
            layer.masksToBounds = false
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
            layer.masksToBounds = false
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
            layer.masksToBounds = false
        }
    }
    
    @IBInspectable var isCircular: Bool {
        get {
            return false
        }
        set {
            cornerRadius = (frame.height < frame.width) ? (frame.height / 2.0) : (frame.width / 2.0)
        }
    }
}
