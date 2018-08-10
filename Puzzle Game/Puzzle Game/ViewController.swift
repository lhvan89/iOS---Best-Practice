//
//  ViewController.swift
//  Puzzle Game
//
//  Created by Van Le on 7/4/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var puzzle0: UIButton!
    @IBOutlet weak var puzzle1: UIButton!
    @IBOutlet weak var puzzle2: UIButton!
    @IBOutlet weak var puzzle3: UIButton!
    @IBOutlet weak var puzzle4: UIButton!
    @IBOutlet weak var puzzle5: UIButton!
    @IBOutlet weak var puzzle6: UIButton!
    @IBOutlet weak var puzzle7: UIButton!
    @IBOutlet weak var puzzle8: UIButton!
    
    var game:[[Int]] = [
        [0,1,2],
        [3,4,5],
        [6,7,8]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initPuzzle(theme: "squirrel")
    }
    
    @IBAction func puzzleAction(_ sender: UIButton) {
        let tag = sender.tag
        
        if tag == 2 || tag == 5 || tag == 8 {
            print("Phai")
        }
    }
    
    func initPuzzle(theme: String){
        let arrButton:[UIButton] = [puzzle0, puzzle1, puzzle2, puzzle3, puzzle4, puzzle5, puzzle6, puzzle7, puzzle8]
        let arrRanNumber = shuffleArray(length: 9)
        for (index, value) in arrButton.enumerated() {
            let image = UIImage(named: "\(theme)_\(arrRanNumber[index])")
            value.setImage(image, for: .normal)
        }
    }
    
    func shuffleArray(length: Int) -> [Int] {
        var arrSequenceNumber = Array(0..<length)
        var arrRandomNumber = [Int]()
        for _ in 0..<arrSequenceNumber.count{
            let rand = Int(arc4random_uniform(UInt32(arrSequenceNumber.count)))
            arrRandomNumber.append(arrSequenceNumber[rand])
            arrSequenceNumber.remove(at: rand)
        }
        return arrRandomNumber
    }
}

//extension Array {
//
//    func shuffle() -> Array {
//
//        var result = self; result.shuffleInPlace(); return result
//    }
//
//    mutating func shuffleInPlace() {
//
//        for i in 1 ..< count { self.swapAt(i, Int(arc4random_uniform(UInt32(i+1)))) }
//    }
//}

extension Array {
    func shuffle() -> Array {
        var result = self
        for i in 1 ..< count {
            result.swapAt(i, Int(arc4random_uniform(UInt32(i+1))))
        }
        return result
    }
}


