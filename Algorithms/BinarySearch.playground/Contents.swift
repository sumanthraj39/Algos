//: Playground - noun: a place where people can play

import UIKit

// Linear Search
func search<T: Equatable> (array : [T], element : T) -> Int? {
    
    for i in 0 ..< array.count {
        if array[i] == element {
            return i
        }
    }
    return nil
}
let numbers = [ 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67 ]
let result = search(array: numbers, element: 5)

// Binary Search //Splitting sorted array

func binarySearch<T: Comparable> (array : [T], element: T) -> Int? {
    var lowerBound = 0
    var upperBound = array.count
    
    while lowerBound < upperBound {
        let midIndex = lowerBound + (upperBound - lowerBound)/2
        if array[midIndex] == element {
            return midIndex
        } else if array[midIndex] < element {
            lowerBound = midIndex + 1
        } else {
            upperBound = midIndex
        }
    }
    return nil
}

func rBinarySearch<T: Comparable>(_ a: [T], key: T, range: Range<Int>) -> Int? {
    if range.lowerBound >= range.upperBound {
        // If we get here, then the search key is not present in the array.
        return nil
        
    } else {
        // Calculate where to split the array.
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        
        // Is the search key in the left half?
        if a[midIndex] > key {
            return rBinarySearch(a, key: key, range: range.lowerBound ..< midIndex)
            
            // Is the search key in the right half?
        } else if a[midIndex] < key {
            return rBinarySearch(a, key: key, range: midIndex + 1 ..< range.upperBound)
            
            // If we get here, then we've found the search key!
        } else {
            return midIndex
        }
    }
}

let bResult = binarySearch(array: numbers, element: 41)
let rbResult = rBinarySearch(numbers, key: 43, range: 0..<numbers.count)


