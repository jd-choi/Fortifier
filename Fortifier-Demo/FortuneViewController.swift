//
//  FortuneViewController.swift
//  Fortifier-Demo
//
//  Created by JD Choi on 12/03/17.
//  Copyright © 2017 NYU. All rights reserved.
//

import UIKit

class FortuneViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var zodiacView: UIImageView!
    @IBOutlet weak var todayFortune: UILabel!
    var userInfo : User?
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let imageViewBackground = UIImageView(frame: CGRect(x:0,y:0,width:width,height:height))
        imageViewBackground.image = UIImage(named: "background")!
        imageViewBackground.contentMode = UIViewContentMode.scaleToFill
        self.view.addSubview(imageViewBackground)
        self.view.sendSubview(toBack: imageViewBackground)
        
        nameLabel.text = (userInfo?.firstName)! + " " + (userInfo?.lastName)!
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        let dobString = formatter.string(from: userInfo?.dob as! Date)
        dobLabel.text = dobString
        genderLabel.text = userInfo?.gender
        zodiacView.image = userInfo?.photo
        
        let originalURL = "https://www.ganeshaspeaks.com/horoscopes/daily-horoscope/"
        let userURL = originalURL + (userInfo?.zodiac)!
        
        guard let myURL = URL(string: userURL) else {
            return
        }
        do {
            let myHTMLString = try String(contentsOf: myURL, encoding: .ascii)
//            let separator1 = "<div class='row margin-bottom-0'>"
            let separator1 = "<p class='margin-top-xs-0' style='font-size:16px;'></p>"
            let temp = myHTMLString.components(separatedBy: separator1)
            let separator2 = "<p class='margin-top-xs-0' style='font-size:16px;'>"
            let temp2 = temp[0].components(separatedBy: separator2)
            let separator3 = "</p>\n<p id='horoscope_single_sign_ccta_id'>"
            let separated = temp2[0].components(separatedBy: separator3)
//            print(temp[0])
        } catch let error {
            print ("Error: Something went wrong.")
        }
        
        
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
    private func loadUsers() -> [User]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: User.ArchiveURL.path) as? [User]
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
