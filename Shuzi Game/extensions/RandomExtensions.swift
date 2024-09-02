import Foundation

extension Int {
    static func generateUniqueRandomInteger(count: Int, lower: Int = 0, upper: Int = 99) -> [Int] {
        if count > upper - lower + 1 || lower > upper {
            return []
        }
        
        var result = [Int]()
        
        while result.count < count {
            let randomInt = Int.random(in: lower...upper)
            
            if !result.contains(randomInt) {
                result.append(randomInt)
            }
        }
        
        return result
    }
}
