//
//  ViewController.swift
//  Multiple PickerView
//
//  Created by lhvan on 5/4/18.
//  Copyright © 2018 lhvan. All rights reserved.
//

import UIKit

let screenSize = UIScreen.main.bounds.size
let screenWidth = screenSize.width
let screenHeight = screenSize.height

class ViewController: UIViewController {
    
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var textField5: UITextField!
    
    @IBOutlet weak var button: UIButton!
    
    var activeTextField: UITextField!
    
    let filters3 = ["--", "Very quiet 3", "Quiet 3", "Fairly quiet 3", "Slightly quiet 3", "Not quiet 3"]
    let filters4 = ["--", "Very good 4", "Good 4", "Fairly good 4", "Slightly good 4", "Not good 4"]
    let filters5 = ["--", "Very good 5", "Good 5", "Fairly good 5", "Slightly good 5", "Not good 5"]
    
    var activeFilters: [String] {
        get {
            if activeTextField == textField3 {
                return filters3
            }
            if activeTextField == textField4 {
                return filters4
            }
            if activeTextField == textField5 {
                return filters5
            }
            return []
        }
    }
    
    var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField3.delegate = self
        textField4.delegate = self
        textField5.delegate = self
        
        initPicker()
        resetAction(self)
    }
    
    @IBAction func resetAction(_ sender: Any) {
        textField3.text = filters3.first
        textField4.text = filters4.first
        textField5.text = filters5.first
    }
    
    func initPicker(){
        pickerView = UIPickerView(frame: CGRect(x: 0, y: screenHeight - 200, width: screenWidth, height: 200))
        pickerView.backgroundColor = .white
        
        //        pickerView.showsSelectionIndicator = true
        pickerView.delegate = self
        pickerView.dataSource = self
        
        //init toolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        toolBar.sizeToFit()
        
        let btnCancel = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPicker))
        let btnSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let btnDone = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donePicker))
        
        toolBar.setItems([btnCancel,btnSpace, btnDone], animated: false)
        
        textField3.inputView = pickerView
        textField3.inputAccessoryView = toolBar
        textField4.inputView = pickerView
        textField4.inputAccessoryView = toolBar
        textField5.inputView = pickerView
        textField5.inputAccessoryView = toolBar

    }
    
    @objc func cancelPicker(){
        activeTextField.resignFirstResponder()
    }
    @objc func donePicker(){
        let row = pickerView.selectedRow(inComponent: 0)
        let value = activeFilters[row]
        print(value)
        activeTextField.resignFirstResponder()
        activeTextField.text = value
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        activeTextField = textField
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if let value = activeTextField.text, let row = activeFilters.index(of: value){
            pickerView.selectRow(row, inComponent: 0, animated: false)
        }
        pickerView.reloadComponent(0)
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return activeFilters.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return activeFilters[row]
    }
}
