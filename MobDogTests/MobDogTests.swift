//
//  MobDogTests.swift
//  MobDogTests
//
//  Created by Lucas Ponce on 19-12-21.
//

import XCTest
@testable import MobDog

class MobDogTests: XCTestCase {
    
    var dogsBreedsVC = DogsBreedsVC()

    func testOneFoundResults() {
        
        let result = 1
        let string = "Showing \(result) found result"
        
        XCTAssertEqual(string, dogsBreedsVC.getToastMessage(numberOfBreeds: result))
    }
    
    func testSeveralFoundResults() {
        
        let results = Int.random(in: 2..<100)
        let string = "Showing \(results) found results"
        
        XCTAssertEqual(string, dogsBreedsVC.getToastMessage(numberOfBreeds: results))
    }

}
