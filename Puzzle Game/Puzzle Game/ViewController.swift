//
//  ViewController.swift
//  Puzzle Game
//
//  Created by Van Le on 7/4/18.
//  Copyright © 2018 Van Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    var puzzle = Array(0...8)
    
    @IBOutlet weak var puzzle1: UIButton!
    @IBOutlet weak var puzzle2: UIButton!
    @IBOutlet weak var puzzle3: UIButton!
    @IBOutlet weak var puzzle4: UIButton!
    @IBOutlet weak var puzzle5: UIButton!
    @IBOutlet weak var puzzle6: UIButton!
    @IBOutlet weak var puzzle7: UIButton!
    @IBOutlet weak var puzzle8: UIButton!
    @IBOutlet weak var puzzle0: UIButton!
    
    var arrButton = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrButton = [puzzle1, puzzle2, puzzle3, puzzle4, puzzle5, puzzle6, puzzle7, puzzle8,puzzle0]
        initPuzzle(buttons: arrButton)
    }
    
    @IBAction func puzzleAction(_ sender: UIButton) {
        print(sender.tag)
    }
    
    func initPuzzle(buttons: [UIButton]){
        var puzzle = Array(0...8)
        for i in 0..<puzzle.count
        {
            let rand = Int(arc4random_uniform(UInt32(puzzle.count)))
            buttons[i].setImage(UIImage(named: "\(puzzle[rand]).png"), for: .normal)
            print(puzzle[rand])
            puzzle.remove(at: rand)
            print(puzzle)
        }
    }
    

	
    
    
    
}

extension Array {
    func randomItem() -> Element? {
        if isEmpty { return nil }
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}

