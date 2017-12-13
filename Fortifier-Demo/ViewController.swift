//
//  ViewController.swift
//  Fortifier-Demo
//
//  Created by JD Choi on 12/03/17.
//  Copyright © 2017 NYU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currentDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let imageViewBackground = UIImageView(frame: CGRect(x:0,y:0,width:width,height:height))
        imageViewBackground.image = UIImage(named: "background")!
        imageViewBackground.contentMode = UIViewContentMode.scaleToFill
        self.view.addSubview(imageViewBackground)
        self.view.sendSubview(toBack: imageViewBackground)
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        // get current date and display in the main view
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat="MM/dd/yyyy"
        let result = formatter.string(from: date)
        currentDate.text = result
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

