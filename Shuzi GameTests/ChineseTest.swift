import XCTest
@testable import Shuzi_Game

final class ChineseTest: XCTestCase {
    
    func testChinese() throws {
           // Setup data
           let nums = [0,3,10,13,17,20,28,39,51,99]
           let nilNums: [Int] = [100, -10, 101, 102, -1, -2]
           
           // Expected Values
           let expectedValues: [(chinese: String, pinyin: String)?] = [
               ("零", "líng"),
               ("三", "sān"),
               ("十", "shí"),
               ("十三", "shí sān"),
               ("十七", "shí qī"),
               ("二十", "èr shí"),
               ("二十八", "èr shí bā"),
               ("三十九", "sān shí jiǔ"),
               ("五十一", "wǔ shí yī"),
               ("九十九", "jiǔ shí jiǔ")
           ]
           
           // Run test
           for i in 0..<nums.count {
               let value1 = nums[i].num99ToChinese()
               
               XCTAssertNotNil(value1)
               
               let value2 = expectedValues[i]
               if let value1, let value2 {
                   XCTAssertEqual(value1.chinese, value2.chinese)
                   XCTAssertEqual(value1.pinyin, value2.pinyin)
               }
           }
           
           // Nil case
           for num in nilNums {
               XCTAssertNil(num.num99ToChinese())
           }
       }
    
}
