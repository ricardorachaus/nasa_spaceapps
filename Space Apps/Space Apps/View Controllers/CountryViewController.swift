//
//  ViewController.swift
//  Space Apps
//
//  Created by Ricardo Rachaus on 20/10/18.
//  Copyright © 2018 Ricardo Rachaus. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let countries = ["", "Japan", "USA", "Brazil"]
    
    var pickerView: UIPickerView!
    @IBOutlet weak var countryTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryTextField.backgroundColor = .clear
        countryTextField.layer.cornerRadius = 20
        countryTextField.layer.borderColor = UIColor.white.cgColor
        countryTextField.layer.borderWidth = 3
        
        pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.backgroundColor = UIColor(red: 91 / 255, green: 91 / 255, blue: 91 / 255, alpha: 1)
        countryTextField.inputView = pickerView
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(CountryViewController.donePressed))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([spaceButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        countryTextField.inputAccessoryView = toolBar
    }
    
    @objc func donePressed() {
        pickerView.resignFirstResponder()
        countryTextField.resignFirstResponder()
        performSegue(withIdentifier: "Form", sender: self)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countryTextField.text = countries[row]
    }

}

