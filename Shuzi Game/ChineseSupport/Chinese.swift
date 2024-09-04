import Foundation

extension Int {
    func num99ToChinese() -> (chinese: String, pinyin: String)? {
        
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

        var chineseResult: String
        var pinyinResult: String
        
        switch(self) {
        case 0...10:
            chineseResult = chineseDigitsWithPinyin[self].chinese
            pinyinResult = chineseDigitsWithPinyin[self].pinyin
        case 11...19:
            chineseResult = "十\(chineseDigitsWithPinyin[self%10].chinese)"
            pinyinResult = "shí \(chineseDigitsWithPinyin[self%10].pinyin)"
        case 20...99:
            // 70
            let tenths = self / 10   // 7
            let digit = self % 10    // 0
            chineseResult = "\(chineseDigitsWithPinyin[tenths].chinese)十\(chineseDigitsWithPinyinEmptyZero[digit].chinese)"
            pinyinResult = "\(chineseDigitsWithPinyin[tenths].pinyin) shí \(chineseDigitsWithPinyinEmptyZero[digit].pinyin)"
        default:
            return nil
        }
        
        pinyinResult = pinyinResult.trimmingCharacters(in: .whitespaces)
        
        return (chineseResult, pinyinResult)
    }
}
