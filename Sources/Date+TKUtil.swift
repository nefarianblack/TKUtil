//
//  Date+TKUtil.swift
//  TKUtil Example
//
//  Created by Tanmay Khandelwal on 02/08/17.
//  Copyright © 2017 Tanmay Khandelwal. All rights reserved.
//

import Foundation

extension Date {
    // MARK:- Difference
    
    func years(from date: Date) -> Int {
        return NSCalendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    
    func months(from date: Date) -> Int {
        return NSCalendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    
    func weeks(from date: Date) -> Int {
        return NSCalendar.current.dateComponents([.weekOfYear], from: date, to: self).weekOfYear ?? 0
    }
    
    func days(from date: Date) -> Int {
        return NSCalendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    
    func hours(from date: Date) -> Int {
        return NSCalendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    
    func minutes(from date: Date) -> Int{
        return NSCalendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    
    func seconds(from date: Date) -> Int{
        return NSCalendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    
    // MARK:- Difference in String
    
    func offset(from date: Date) -> String {
        
        if years(from: date)   > 0 { return "\(years(from: date))y" }
        if months(from: date)  > 0 { return "\(months(from: date))M" }
        if weeks(from: date)   > 0 { return "\(weeks(from: date))w" }
        if days(from: date)    > 0 { return "\(days(from: date))d" }
        if hours(from: date)   > 0 { return "\(hours(from: date))h" }
        if minutes(from: date) > 0 { return "\(minutes(from: date))m" }
        if seconds(from: date) > 0 { return "\(seconds(from: date))s" }
        
        return ""
    }
    
    func offsetVerbose(fromDate date: Date) -> String {
        
        if      years(from: date) > 1       { return "\(years(from: date)) years" }
        else if years(from: date) == 1      { return "\(years(from: date)) year" }
        
        if      months(from: date) > 1      { return "\(months(from: date)) months" }
        else if months(from: date) == 1     { return "\(months(from: date)) month" }
        
        if      weeks(from: date) > 1       { return "\(weeks(from: date)) weeks" }
        else if weeks(from: date) == 1      { return "\(weeks(from: date)) week" }
        
        if      days(from: date) > 1        { return "\(days(from: date)) days" }
        else if days(from: date) == 1       { return "\(days(from: date)) day" }
        
        if      hours(from: date) > 1       { return "\(hours(from: date)) hours" }
        else if hours(from: date) == 1      { return "\(hours(from: date)) hour" }
        
        if      minutes(from: date) > 1     { return "\(minutes(from: date)) minutes" }
        else if minutes(from: date) == 1    { return "\(minutes(from: date)) minute" }
        
        if      seconds(from: date) > 0     { return "\(seconds(from: date)) seconds" }
        else if seconds(from: date) == 1    { return "\(seconds(from: date)) second" }
        
        return ""
    }
    
    func daySuffix() -> String {
        let dayOfMonth = NSCalendar.current.component(.day, from: self)
        
        switch dayOfMonth {
        case 1, 21, 31: return "st"
        case 2, 22: return "nd"
        case 3, 23: return "rd"
        default: return "th"
        }
    }
}
