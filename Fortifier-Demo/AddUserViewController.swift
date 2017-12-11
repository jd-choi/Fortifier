//
//  AddUserViewController.swift
//  Fortifier-Demo
//
//  Created by JD Choi on 12/10/17.
//  Copyright © 2017 NYU. All rights reserved.
//

import UIKit

class AddUserViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let imageViewBackground = UIImageView(frame: CGRect(x:0,y:0,width:width,height:height))
        imageViewBackground.image = UIImage(named: "background")!
        imageViewBackground.contentMode = UIViewContentMode.scaleToFill
        self.view.addSubview(imageViewBackground)
        self.view.sendSubview(toBack: imageViewBackground)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
