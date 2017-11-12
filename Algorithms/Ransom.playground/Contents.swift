//: Playground - noun: a place where people can play

import UIKit

func canConstruct(_ ransomNote: String, _ magzine: String) -> Bool {
    
    if ransomNote.characters.count < 0 {
       return true
    }
    
    if magzine.characters.count < 0 {
       return false
    }
    
    
    var dict = [Character: Int]()
    
    for value in ransomNote.characters {
        
        if let val = dict[value] {
            dict[value] = val + 1
        }
        else {
            dict[value] = 1
        }
    }
    
    for ch in magzine.characters {
        if let val = dict[ch] {
            dict[ch] = val - 1
            if dict[ch] == 0 {
                dict[ch] = nil
            }
            if dict.keys.count == 0 {
                return true
            }
        }
    }
    return false
}

canConstruct("a", "b")
canConstruct("aa", "ab")
canConstruct("aa", "aab")



