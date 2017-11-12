//: Playground - noun: a place where people can play

import UIKit

func duplicates(_ nums: [Int]) -> [Int] {
    var res = [Int]()
    var n = nums
    for num in n {
        let index = abs(num) - 1
        if n[index] < 0 {
            
            res.append(abs(index + 1))
        }
        n[index] = -n[index]
    }
    return res
}

duplicates([4,3,2,7,8,2,3,1])




// Write a func to take a string and reverse its vowels
// input = "ice-cream", output = "ace-creim"
// ice-cream -> i,e,e,a -> a, e, e, i
// input = "cat", output = "cat"

// Consider you have an existing 'func isVowel(_ ch: Character) -> Bool'

import Foundation

extension String {
    
    subscript (_ x: Int) -> Character {
        return self[self.startIndex.advancedBy(x)]
    }
}

func reverseVowels (_ str: String) -> String {
    
    guard str.characters.count > 0 else {
        return ""
    }
    
    var i = 0
    var s = str
    
    var j = str.characters.count - 1
    
    while (i < j) {
        
        if isVowel(str[i]) && isVowel(s[j]) {
            var temp = str[i]
            s[i] = s[j]
            s[j] = temp
            i += 1
            j -= 1
        }
        else {
            i =  !isVowel(str[i]) ? i + 1 : i
            j =  !isVowel(str[j]) ? j - 1 : j
        }
    }
    
    return str
    
}

