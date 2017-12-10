//
//  Fortifier_DemoTests.swift
//  Fortifier-DemoTests
//
//  Created by JD Choi on 12/10/17.
//  Copyright © 2017 NYU. All rights reserved.
//

import XCTest
@testable import Fortifier_Demo

class Fortifier_DemoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    //MARK: User Class Test
    func testUserInitializationSucceds(){
        let emptyZodiacUser = User.init(firstName:"Empty", lastName:"Zodiac", gender:"Male", dob:Date() as NSDate, zodiac:"")
        XCTAssertNotNil(emptyZodiacUser)
    }
    
    func testUserInitializationFails() {
        let emptyFirstName = User.init(firstName: "", lastName: "Choi", gender: "Male", dob: Date() as NSDate, zodiac: "Taurus")
        XCTAssertNil(emptyFirstName)
        let emptyLastName = User.init(firstName: "JD", lastName: "", gender: "Male", dob: Date() as NSDate, zodiac: "Taurus")
        XCTAssertNil(emptyLastName)
        let emptyGender = User.init(firstName: "JD", lastName: "Choi", gender: "", dob: Date() as NSDate, zodiac: "Taurus")
        XCTAssertNil(emptyGender)
        let emptyDOB = User.init(firstName: "JD", lastName: "Choi", gender: "Male", dob: nil, zodiac: "Taurus")
        XCTAssertNil(emptyDOB)
    }
    
}
