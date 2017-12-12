//
//  AddUserViewController.swift
//  Fortifier-Demo
//
//  Created by JD Choi on 12/03/17.
//  Copyright © 2017 NYU. All rights reserved.
//

import UIKit
import os.log

// UITextFieldDelegate added
class AddUserViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var greetUserLabel: UILabel!
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var dobPicker: UIDatePicker!
    @IBOutlet weak var genderTF: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This would help to show greeting msg to the user according to their first name
        firstNameTF.delegate = self
        
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let imageViewBackground = UIImageView(frame: CGRect(x:0,y:0,width:width,height:height))
        imageViewBackground.image = UIImage(named: "background")!
        imageViewBackground.contentMode = UIViewContentMode.scaleToFill
        self.view.addSubview(imageViewBackground)
        self.view.sendSubview(toBack: imageViewBackground)
    }
    
    // MARK: UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // When hit done on keyboard
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (textField.text != "") {
            greetUserLabel.text = "Welcome, " + textField.text!
        }
        undateSaveButtonState()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log ("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        let firstName = firstNameTF.text
        let lastName = lastNameTF.text
        let dob = dobPicker.date
        let gender = genderTF.text
        let calendar = Calendar.current
        var zodiac = ""
        let components = calendar.dateComponents([.month,.day,.year], from: dobPicker.date)
        if components.month == 1 {
            if components.day! < 20 {
                zodiac = "capricorn"
            }
            else {
                zodiac = "acuarius"
            }
        }
        else if components.month == 2 {
            if components.day! < 19 {
                zodiac = "acuarius"
            }
            else {
                zodiac = "pisces"
            }
        }
        else if components.month == 3 {
            if components.day! < 21 {
                zodiac = "pisces"
            }
            else {
                zodiac = "aries"
            }
        }
        else if components.month == 4 {
            if components.day! < 20 {
                zodiac = "aries"
            }
            else {
                zodiac = "taurus"
            }
        }
        else if components.month == 5 {
            if components.day! < 21 {
                zodiac = "taurus"
            }
            else {
                zodiac = "gemini"
            }
        }
        else if components.month == 6 {
            if components.day! < 21 {
                zodiac = "gemini"
            }
            else {
                zodiac = "cancer"
            }
        }
        else if components.month == 7 {
            if components.day! < 22 {
                zodiac = "cancer"
            }
            else {
                zodiac = "leo"
            }
        }
        else if components.month == 8 {
            if components.day! < 23 {
                zodiac = "leo"
            }
            else {
                zodiac = "virgo"
            }
        }
        else if components.month == 9 {
            if components.day! < 23 {
                zodiac = "virgo"
            }
            else {
                zodiac = "libra"
            }
        }
        else if components.month == 10 {
            if components.day! < 23{
                zodiac = "libra"
            }
            else {
                zodiac = "scorpio"
            }
        }
        else if components.month == 11 {
            if components.day! < 22 {
                zodiac = "scorpio"
            }
            else {
                zodiac = "sagittarius"
            }
        }
        else if components.month == 12 {
            if components.day! < 22 {
                zodiac = "sagittarius"
            }
            else {
                zodiac = "capricorn"
            }
        }
        
        user = User(firstName: firstName!, lastName: lastName!, gender: gender!, dob: dob as NSDate, zodiac: zodiac, photo: UIImage(named: zodiac))
    }
    
    //MARK: Private Methods
    private func undateSaveButtonState() {
        let text = firstNameTF.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
