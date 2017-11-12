//: Playground - noun: a place where people can play

import UIKit

func coinChange(amount :Int, coins:[Int]) -> [Int] {
    guard amount > 0 else {
        return []
    }
    
    var cache = [Int : [Int]]()
    
    func recursionCoin(_ value : Int) -> [Int] {
        guard value > 0 else {
            return []
        }
        
        if let cached = cache[value] {
            return cached
        }
        
        var potentialChangeArray = [[Int]]()
        
        for coin in coins {
            
            if value - coin >= 0 {
                var potentialChange: [Int] = [coin]
                potentialChange.append(contentsOf: recursionCoin(value - coin))
                if potentialChange.reduce(0, +) == value {
                    potentialChangeArray.append(potentialChange)
                }
            }
        }
        if potentialChangeArray.count > 0 {
            let sorted = potentialChangeArray.sorted(by: { $0.count < $1.count})
            cache[value] = sorted[0]
            print(sorted)
            return sorted[0]
        }
        return []
    }
    
    let change = recursionCoin(amount)
    
    if change.reduce(0, +) != amount {
        return []
    }
    return change
}


coinChange(amount: 12, coins: [1,4,5])
