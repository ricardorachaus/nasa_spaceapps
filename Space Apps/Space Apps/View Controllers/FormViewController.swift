//
//  FormViewController.swift
//  Space Apps
//
//  Created by Ricardo Rachaus on 20/10/18.
//  Copyright © 2018 Ricardo Rachaus. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {
    
    var goingDatePicker: UIDatePicker!
    var returnDatePicker: UIDatePicker!
    
    @IBOutlet weak var goingTextField: UITextField!
    @IBOutlet weak var returnTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goingDatePicker = UIDatePicker()
        returnDatePicker = UIDatePicker()
        update(textField: goingTextField, with: goingDatePicker, selector: "pressedGoingDone")
        update(textField: returnTextField, with: returnDatePicker, selector: "pressedReturnDone")
    }
    
    @IBAction func goingDateField(_ sender: UITextField) {
        goingDatePicker.datePickerMode = .date
        goingTextField.inputView = goingDatePicker
        goingDatePicker.addTarget(self, action: #selector(FormViewController.goingChangeValue), for: .valueChanged)
    }
    
    @IBAction func returnDateField(_ sender: UITextField) {
        returnDatePicker.datePickerMode = .date
        returnTextField.inputView = returnDatePicker
        returnDatePicker.addTarget(self, action: #selector(FormViewController.returnChangeValue), for: .valueChanged)
    }
    
    private func update(textField: UITextField, with datePicker: UIDatePicker, selector: String) {
        textField.backgroundColor = .clear
        textField.layer.cornerRadius = 20
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.borderWidth = 3
        
        datePicker.backgroundColor = UIColor(red: 91 / 255, green: 91 / 255, blue: 91 / 255, alpha: 1)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: Selector(selector))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([spaceButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }
    
    @objc func goingChangeValue(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        goingTextField.text = dateFormatter.string(from: sender.date)
    }
    
    @objc func returnChangeValue(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        returnTextField.text = dateFormatter.string(from: sender.date)
    }
    
    @objc func pressedGoingDone() {
        goingDatePicker.resignFirstResponder()
        goingTextField.resignFirstResponder()
    }
    
    @objc func pressedReturnDone() {
        returnDatePicker.resignFirstResponder()
        returnTextField.resignFirstResponder()
        performSegue(withIdentifier: "Disaster", sender: self)
    }
    
    

}
