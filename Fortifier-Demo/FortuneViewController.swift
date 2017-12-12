//
//  FortuneViewController.swift
//  Fortifier-Demo
//
//  Created by JD Choi on 12/03/17.
//  Copyright © 2017 NYU. All rights reserved.
//

import UIKit

class FortuneViewController: UIViewController {
    @IBOutlet weak var todayFortune: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let imageViewBackground = UIImageView(frame: CGRect(x:0,y:0,width:width,height:height))
        imageViewBackground.image = UIImage(named: "background")!
        imageViewBackground.contentMode = UIViewContentMode.scaleToFill
        self.view.addSubview(imageViewBackground)
        self.view.sendSubview(toBack: imageViewBackground)
        todayFortune.text = "You're not somebody who would do something just for the sake of doing it. In fact, your desire to achieve your dreams will lead you towards putting your best foot forward and probably setting up a new business venture. Today, you'll also get done with some old assignments or projects, says Ganesha."
        todayFortune.numberOfLines = 0
        todayFortune.preferredMaxLayoutWidth = 700
        todayFortune.lineBreakMode=NSLineBreakMode.byWordWrapping
        todayFortune.sizeToFit()

        // Do any additional setup after loading the view.
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
