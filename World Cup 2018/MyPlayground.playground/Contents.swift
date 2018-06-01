//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZZ"

let date = dateFormatter.date(from: "2018-06-14 22:00:00 GMT+07:00")
let current = Date()
dateFormatter.string(from: date!)
//let string = dateFormatter.string(from: date)
//dateFormatter.string(from: Date())

