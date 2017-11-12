//: Playground - noun: a place where people can play

import UIKit

func noOfRows(_ indexPath1: IndexPath, _ indexPath2 : IndexPath) -> Int {
    var result = 0
    var sign = indexPath1 > indexPath2 ? 1 : -1
    let section1 = sign > 0 ? indexPath1.section : indexPath2.section
    let section2 =  sign > 0 ? indexPath2.section : indexPath1.section
    
    if section1 == section2 {
        result = indexPath1.row - indexPath2.row
    }
    else {
        for x in section1...section2 {
            
            if section1 == x {
                result += tableView.noOfRowsinSection(x) - indexPath1.row
            }
            else if section2 == x {
                result += tableView.noOfRowsinSection(x) - indexPath2.row
            }
            else {
                result += tableView.noOfRowsinSection(x)
            }
        }
    }
    
    return result * sign
}

















class Solution {
    
    func isHappy(_ n: Int) -> Bool {
        if n == 1 {
            return true
        }
        var slow = n
        var fast = n
        repeat {
            slow = digitSquare(slow)
            fast = digitSquare(fast)
            fast = digitSquare(fast)
            print(slow, fast)
        }
            while (slow != fast)
        if slow == 1 {
            return true
        }
        else {
            return false
        }
    }
    
    func digitSquare(_ n: Int) -> Int {
        var sum = 0
        var t = n
        while (t > 0) {
            let l = t % 10
            sum += l * l
            t = t/10
        }
        return sum
    }
}


let sol = Solution()
sol.isHappy(7)
