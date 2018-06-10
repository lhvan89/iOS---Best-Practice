//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let dayString = "2018-06-14"
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"
let date = dateFormatter.date(from: dayString)
