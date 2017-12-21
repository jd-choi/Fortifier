//
//  User.swift
//  Fortifier-Demo
//
//  Created by JD Choi on 12/03/17.
//  Copyright © 2017 NYU. All rights reserved.
//

// import Foundation
import UIKit
import os.log


class User: NSObject, NSCoding {
    var firstName: String
    var lastName: String
    var gender: String
    var dob: NSDate?
    var lunarDob: String
    var zodiac: String
    var photo: UIImage?
    
    init?(firstName:String, lastName:String, gender:String, dob:NSDate?, lunarDob:String, zodiac:String, photo:UIImage?) {
        // Initialize should fail if there is no name or dob
        if firstName.isEmpty || lastName.isEmpty || gender.isEmpty || dob == nil {
            return nil
        }
        // Initialize properties
        self.firstName = firstName;
        self.lastName = lastName;
        self.gender = gender;
        self.dob = dob;
        self.lunarDob = lunarDob;
        self.zodiac = zodiac;
        self.photo = photo;
    }
    required convenience init?(coder aDecoder: NSCoder) {
        guard let firstName = aDecoder.decodeObject(forKey: PropertyKey.firstName) as? String else {
            os_log("Unable to decode the first name for a User object.", log:OSLog.default, type: .debug)
            return nil
        }
        // Because zodiac is an optional property of User, just use conditional cast.
        let zodiac = aDecoder.decodeObject(forKey: PropertyKey.zodiac) as? String
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        let lastName = aDecoder.decodeObject(forKey: PropertyKey.lastName) as? String
        let gender = aDecoder.decodeObject(forKey: PropertyKey.gender) as? String
        let dob = aDecoder.decodeObject(forKey: PropertyKey.dob) as? NSDate
        let lunarDob = aDecoder.decodeObject(forKey: PropertyKey.lunarDob) as? String
        
        self.init(firstName: firstName, lastName: lastName!, gender: gender!, dob: dob, lunarDob: lunarDob!, zodiac: zodiac!, photo: photo)
    }
    
    struct PropertyKey {
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let gender = "gender"
        static let dob = "dob"
        static let zodiac = "zodiac"
        static let photo = "photo"
        static let lunarDob = "lunarDob"
    }
    
    //Mark: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("users")
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(firstName, forKey: PropertyKey.firstName)
        aCoder.encode(lastName, forKey: PropertyKey.lastName)
        aCoder.encode(gender, forKey: PropertyKey.gender)
        aCoder.encode(dob, forKey: PropertyKey.dob)
        aCoder.encode(zodiac, forKey: PropertyKey.zodiac)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(lunarDob, forKey: PropertyKey.lunarDob)
    }
    
    
    
    
}
