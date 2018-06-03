//
//  StringHelper.swift
//  World Cup 2018
//
//  Created by lhvan on 6/4/18.
//  Copyright © 2018 Van. All rights reserved.
//

import Foundation

import UIKit

extension String {
    
    static func showFormatDate(date:Date) -> String {
        
        let calendar = Calendar.current //NSCalendar.currentCalendar()
        let hour = calendar.component(.hour, from: date)
        let day = calendar.component(.day,from: date)
        let month = calendar.component(.month,from: date)
        let minute = calendar.component(.minute, from: date)
        let weekday = calendar.component(.weekday, from: date)
        var weekdayString = ""
        switch weekday {
        case 2:
            weekdayString = "Mon"
            break
        case 3:
            weekdayString = "Tue"
            break
        case 3:
            weekdayString = "Wed"
            break
        case 4:
            weekdayString = "Thu"
            break
        case 5:
            weekdayString = "Fri"
            break
        case 6:
            weekdayString = "Sat"
            break
        case 7:
            weekdayString = "Sun"
            break
        default:
            break
        }
        
        let hourStr = hour < 10 ? "0\(hour)" : "\(hour)"
        let dayStr = day < 10 ? "0\(day)" : "\(day)"
        let monthStr = month < 10 ? "0\(month)" : "\(month)"
        let minuteStr = minute < 10 ? "0\(minute)" : "\(minute)"
        
        let dateStr:String = "\(weekdayString), \(dayStr)/\(monthStr) - \(hourStr):\(minuteStr)"
        return dateStr
    }
    
    static func showFormatTime(date:Date) -> String {
        
        let calendar = Calendar.current
        let hour = calendar.component(.hour,from: date)
        let minute = calendar.component(.minute, from: date)
        let hourStr = hour < 10 ? "0\(hour)" : "\(hour)"
        let minuteStr = minute < 10 ? "0\(minute)" : "\(minute)"
        
        let dateStr:String = "\(hourStr):\(minuteStr)"
        return dateStr
    }
}

