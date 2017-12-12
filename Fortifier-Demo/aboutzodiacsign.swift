//
//  aboutzodiacsign.swift
//  Fortifier-Demo
//
//  Created by Dennis Park on 12/03/17.
//  Copyright © 2017 NYU. All rights reserved.
//

import Foundation
import UIKit
var images = ["01.jpg","02.jpg","03.jpg","04.jpg","05.jpg","06.jpg","07.jpg","08.jpg","09.jpg", "10.jpg","11.jpg","12.jpg"]
var index = 0
class aboutzodiacsign: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet var leftSwipe: UISwipeGestureRecognizer!
    @IBOutlet var rightSwipe: UISwipeGestureRecognizer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pageControl.numberOfPages = images.count
        pageControl.currentPage=0
        imgView.image = UIImage(named:images[0])
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func pageChanged(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    
    @IBAction func leftswipedone(_ sender:
        UISwipeGestureRecognizer) {
        if (pageControl.currentPage<images.count-1){
            pageControl.currentPage = pageControl.currentPage+1
            imgView.image = UIImage(named: images[pageControl.currentPage])
        }
    }
    
    @IBAction func rightswipedone(_ sender: UISwipeGestureRecognizer) {
        if (pageControl.currentPage>0){
            pageControl.currentPage = pageControl.currentPage-1
            imgView.image = UIImage(named: images[pageControl.currentPage])
        }
    }
    
}
