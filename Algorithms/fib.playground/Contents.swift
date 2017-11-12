//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
func fibonacci(_ n:Int) -> [Int] {
    
    var num1 = 0
    var num2 = 1
    var resultArray = [Int]()
    
    for _ in 0..<n {
        
        let total = num1 + num2
        
        num1 = num2
        num2 = total
        
       resultArray.append(total)
    }
    
    return resultArray
}

fibonacci(7)

func fizzBuzz(_ n:Int, multiple1: Int, multiple2: Int) {
    
    let array = fibonacci(n)
    
    for i in array {
        
        if i % (multiple1 * multiple2) == 0 {
            print("FizzBuzz")
        }
            
        else if i % multiple1 == 0{
            print("Fizz")
        }
            
        else if i % multiple2 == 0{
            print("Buzz")
        }
        else {
            print("\(i)")
        }
        
    }
}

fizzBuzz(20, multiple1: 3, multiple2: 5)