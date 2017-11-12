//: Playground - "{} () ()"

import UIKit

struct Stack<Element> {
    fileprivate var array: [Element] = []
    
    mutating func push(_ element: Element) {
        array.append(element)
    }
    
    mutating func pop() -> Element? {
        return array.popLast()
    }
    
    func peek() -> Element? {
        return array.last
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
}

extension Stack: CustomStringConvertible {
    // 2
    var description: String {
        // 3
        let topDivider = "---Stack---\n"
        let bottomDivider = "\n-----------\n"
        
        // 4
        let stackElements = array.map{ "\($0)" }.joined(separator: "\n")
        // 5
        return topDivider + stackElements + bottomDivider
    }
}

func isValid(_ s: String) -> Bool {
    var container = Stack<String>()
    for item in s.characters {
        switch item {
        case "{" :
            container.push("}")
        case "(" :
            container.push(")")
        case "[" :
            container.push("]")
        default :
            if container.isEmpty || container.pop() != "\(item)" {
                return false
            }
        }
    }
    container.array
    container.description
    return container.isEmpty
}

let result = isValid("[]{}")






