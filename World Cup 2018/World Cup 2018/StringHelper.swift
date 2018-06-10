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
        
        let calendar = Calendar.current

        let day = calendar.component(.day,from: date)
        let month = calendar.component(.month,from: date)
        let year = calendar.component(.year, from: date)
        let weekday = calendar.component(.weekday, from: date)
        var weekdayString = ""
        switch weekday {
        case 2:
            weekdayString = "Monday".localized()
            break
        case 3:
            weekdayString = "Tuesday".localized()
            break
        case 4:
            weekdayString = "Wednesday".localized()
            break
        case 5:
            weekdayString = "Thursday".localized()
            break
        case 6:
            weekdayString = "Friday".localized()
            break
        case 7:
            weekdayString = "Saturday".localized()
            break
        default:
            weekdayString = "Sunday".localized()
            break
        }
        
        let dayStr = day < 10 ? "0\(day)" : "\(day)"
        let monthStr = month < 10 ? "0\(month)" : "\(month)"
        
        let dateStr:String = "\(weekdayString), \(dayStr)/\(monthStr)/\(year)"
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

