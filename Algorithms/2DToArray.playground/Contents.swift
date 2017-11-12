//: Playground - noun: a place where people can play

import UIKit

class solution {

    func twoDToArray(twoDarray: [[Int]]) -> [Int] {
    
        var result = [Int]()
        for (i,x) in twoDarray.enumerated() {
            for (j,y) in x.enumerated() {
                
                result.append(y)
            }
        }
        print(result)
        return result
        
    }
}

let sol = solution()

sol.twoDToArray(twoDarray: [[1,2,3,4], [4,6,7,8]])

class SolutionSq {
    func mySqrt(_ x: Int) -> Int {
        guard x > 0 else {
            return 0
        }
        
        var l = 0
        var r = Int.max
        var mid = 0
        while (true) {
            mid = l + (r - l) / 2
            if mid > x/mid {
                r = mid - 1
            }
            else {
                if (mid + 1) > x/(mid + 1) {
                    return mid
                }
                l = mid + 1
            }
        }
        return 0
    }
}

let s = SolutionSq()

s.mySqrt(8)
