//
//  ViewController.swift
//  Fortifier-Demo
//
//  Created by JD Choi on 12/10/17.
//  Copyright © 2017 NYU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currentDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get current date and display in the main view
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat="dd/MM/yyyy"
        let result = formatter.string(from: date)
        currentDate.text = result
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

