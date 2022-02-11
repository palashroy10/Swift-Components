//
//  ViewController.swift
//  TextviaVoice
//
//  Created by Palash Roy on 10/02/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textInputFeild: UITextField!
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let language = textField.textInputMode?.primaryLanguage, language == "dictation" {
            textLabel.text = textField.text
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(addtolabel), userInfo: nil, repeats: false)
            
        } else {
            print("From typing")
        }
    }
    
    @IBAction func micClicked(_ sender: Any) {
        textInputFeild.text
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    @objc func addtolabel(){
        timer.invalidate()
        textInputFeild.resignFirstResponder()
    }
}

