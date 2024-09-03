import Foundation


func myMax(x: Int, y: Int, z: Int) -> Int {
    if x >= y && x >= z {
        x
    } else if y >= x && y >= z {
        y
    } else {
        z
    }
}
