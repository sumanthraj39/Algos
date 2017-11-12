//: Playground - noun: a place where people can play

class Solution {
   static func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    for (index1, value1) in nums.enumerated() {
        for (index2, value2) in nums.enumerated() {
            if index1 != index2, target == value1 + value2 {
                return [index1,index2]
            }
        }
    }
    return []
    }
}

let num = Solution.twoSum([2, 7, 11, 15], 13)
print("\(num)")

//var subStrArr = [String]()
//
//func subStrings (_ s: String) {
//    for i in 0..<s.characters.count {
//        for j in i+1..<s.characters.count - i {
//            let value = s.index(s, offsetBy: 3)
//            subStrArr.append()
//        }
//    }
//}
//
//"pwwkew"

func longestPalindrome(_ s: String) -> String {
    var res = 0
    var dict = [Int: String]()
    for (j,val) in s.characters.enumerated() {
        let subStr = s[s.index(s.startIndex, offsetBy: j)]
        if isPalin(String(subStr)) {
            res = res > String(subStr).characters.count ? res : String(subStr).characters.count
            dict[String(subStr).characters.count] = String(subStr)
        }
    }
    return dict[res]!
}

func isPalin (_ s: String) -> Bool {
    let char = s.characters.reversed()
    let revStrin = String(char)
    return s == revStrin
}

longestPalindrome("babad")

