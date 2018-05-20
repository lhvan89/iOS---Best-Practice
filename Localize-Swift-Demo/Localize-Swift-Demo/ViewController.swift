//
//  ViewController.swift
//  Localize-Swift-Demo
//
//  Created by lhvan on 5/20/18.
//  Copyright © 2018 lhvan. All rights reserved.
//

import UIKit
import Localize_Swift

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    let availableLanguages = Localize.availableLanguages()

    override func viewDidLoad() {
        super.viewDidLoad()
        setText()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(setText), name: NSNotification.Name( LCLLanguageChangeNotification), object: nil)
    }
    
    @objc func setText(){
        label.text = "Hello".localized()
    }

    @IBAction func doChangeLanguage(_ sender: Any) {
        let actionSheet = UIAlertController(title: nil, message: "Switch Language", preferredStyle: UIAlertControllerStyle.actionSheet)
        for language in availableLanguages {
            let displayName = Localize.displayNameForLanguage(language)
            let languageAction = UIAlertAction(title: displayName, style: .default, handler: {
                (alert: UIAlertAction!) -> Void in
                Localize.setCurrentLanguage(language)
            })
            actionSheet.addAction(languageAction)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: {
            (alert: UIAlertAction) -> Void in
        })
        actionSheet.addAction(cancelAction)
        self.present(actionSheet, animated: true, completion: nil)
    }
}

