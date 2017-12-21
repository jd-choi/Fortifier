//
//  SajuViewController.swift
//  Fortifier-Demo
//
//  Created by JD Choi on 12/20/17.
//  Copyright © 2017 NYU. All rights reserved.
//

import UIKit

class SajuViewController: UIViewController {
    @IBOutlet weak var lunarLabel: UILabel!
    @IBOutlet weak var userInfoLabel: UILabel!
    var users = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
        users = loadUsers()!
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let imageViewBackground = UIImageView(frame: CGRect(x:0,y:0,width:width,height:height))
        imageViewBackground.image = UIImage(named: "background")!
        imageViewBackground.contentMode = UIViewContentMode.scaleToFill
        self.view.addSubview(imageViewBackground)
        self.view.sendSubview(toBack: imageViewBackground)
        if (users.count == 0) {
            userInfoLabel.text = "In order to use this page, you should go to Today's fortune view and add a user and comback. Thank you!"
            lunarLabel.text = "No Info"
        }
        else {
            let lunarDob = getLunarDate(solarDate: users[0].dob as! NSDate)
            let calendar = Calendar.current
            let components = calendar.dateComponents([.month,.day,.year], from: users[0].dob as! Date)
            print(components.year!)
            lunarLabel.text = lunarDob + "/" + String(describing: components.year!)
            userInfoLabel.text = "Hello, " + users[0].firstName + ". We have calculated your lunar date of birth according to your date of birth. Your lunar birth day is. We will use this information in order to create saju fortune. We are currently working on saju fortune, so please come back later! Thank you."
        }
        userInfoLabel.numberOfLines = 0
        userInfoLabel.preferredMaxLayoutWidth = 700
        userInfoLabel.lineBreakMode=NSLineBreakMode.byWordWrapping
        userInfoLabel.sizeToFit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getLunarDate(solarDate: NSDate) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
//        formatter.dateStyle = .medium
        formatter.calendar = Calendar(identifier: Calendar.Identifier.chinese)
        formatter.dateFormat = "MM/dd"
        print("Testing")
        print(solarDate)
        return formatter.string(from: solarDate as Date)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    private func loadUsers() -> [User]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: User.ArchiveURL.path) as? [User]
    }
}
