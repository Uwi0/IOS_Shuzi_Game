import Foundation

class Chinese {
    static func num99TOChinese(num: Int) -> (chinese: String, pinyin: String)? {
        
        let chineseDigitsWithPinyin: [(chinese: String, pinyin: String) ] = [
            ("零", "líng"),  // 0
            ("一", "yī"),    // 1
            ("二", "èr"),    // 2
            ("三", "sān"),
            ("四", "sì"),
            ("五", "wǔ"),
            ("六", "liù"),
            ("七", "qī"),
            ("八", "bā"),
            ("九", "jiǔ"),
            ("十", "shí")    // 10
        ]
        
        let chineseDigitsWithPinyinEmptyZero: [(chinese: String, pinyin: String)] = [
            ("", ""),
            ("一", "yī"),
            ("二", "èr"),
            ("三", "sān"),
            ("四", "sì"),
            ("五", "wǔ"),
            ("六", "liù"),
            ("七", "qī"),
            ("八", "bā"),
            ("九", "jiǔ"),
            ("十", "shí")
        ]
        
        
        return nil
    }
}
