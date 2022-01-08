import Foundation


//Symbol       Value
//I             1
//V             5
//X             10
//L             50
//C             100
//D             500
//M             1000
//For example, 2 is written as II in Roman numeral, just two one's added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.
//
//Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:
//
//I can be placed before V (5) and X (10) to make 4 and 9.
//X can be placed before L (50) and C (100) to make 40 and 90.
//C can be placed before D (500) and M (1000) to make 400 and 900.

class Solution {
    func romanToInt(_ s: String) -> Int {
        let strComp = Array(s).map({$0.description})
        guard s.count > 0 else{
            return 0
        }
        let hash1 = ["I" : 1,"V" : 5, "X" : 10, "L" : 50, "C" : 100, "D" : 500, "M" : 1000]
        let hash2 = ["IV" : 4,"IX" : 9, "XL" : 40, "XC" : 90, "CD" : 400, "CM" : 900]
        var sum = 0
        var i = strComp.count - 1
        while i >= 0{
            if i > 0 && hash2[(strComp[i-1]+strComp[i])] != nil{
                sum += hash2[(strComp[i-1]+strComp[i])] ?? 0
                i -= 2
            }else{
                sum += hash1[strComp[i]] ?? 0
                i -= 1
            }
        }
        return sum
    }
}

print(Solution().romanToInt("IX"))
