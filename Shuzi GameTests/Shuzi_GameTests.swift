//
//  Shuzi_GameTests.swift
//  Shuzi GameTests
//
//  Created by dwi prasetyo on 02/09/24.
//

import XCTest
@testable import Shuzi_Game

final class Shuzi_GameTests: XCTestCase {
    
    func testMax() throws {
        let data1 = (x: 3, y: 10, z: 7)
        let dataArray = [
            (x: 3, y: 10, z: 7),
            (x: 3, y: 7, z: 10),
            (x: 7, y: 10, z: 3),
            (x: 7, y: 3, z: 10),
            (x: 10, y: 3, z: 7),
            (x: 10, y: 7, z: 3),
            (x: 5, y: 5, z: 5),
            (x: -15, y: 15, z: 0)
        ]
        
        
        let expectedValues = [
            10,10,10,10,10,10,5,15
        ]
        
        for i in 0..<dataArray.count {
            let data = dataArray[i]
            let expectedValue = expectedValues[i]
            let evaluatedValue = myMax(x: data.x, y: data.y, z: data.z)
            
            XCTAssertEqual(expectedValue, evaluatedValue)
        }
    }


}
