//: Playground - noun: a place where people can play

import UIKit

class LinkedListNode<T> {
    var value: T
    var next : LinkedListNode<T>?
    
    init(value : T) {
        self.value = value
    }
    weak var prev : LinkedListNode<T>?
}

class LinkedList <T> {
    typealias node = LinkedListNode<T>
    private var head: node?
    private var tail: node?
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: node? {
        return head
    }
    
    var lastIfTail: node? {
        return tail
    }
    
    var last: node? {
        if var n = head {
            while let tail = n.next {
                n = tail
            }
            return n
        } else {
            return nil
        }
    }
    
    func addToList(value: T) {
        let newNode = node(value: value)
        if let l = last {
            l.next = newNode
            newNode.prev = l
        }
        else {
            head = newNode
        }
    }
    
    var count: Int {
        if var node = head {
            var c = 1
            while let tail = node.next {
                c += 1
                node = tail
            }
            return c
        }
        else {
        return 0
        }
    }
    
    func nodeAtIndex(_ index: Int) -> node? {
        var i = index
        var node = head
        if index >= 0 {
            while node != nil {
                if i == 0 {
                    return node
                }
                node = node?.next
                i -= 1
            }
        }
        return nil
    }
    
    subscript(index: Int) -> T {
        let node = nodeAtIndex(index)
        assert(node != nil)
        return node!.value
    }
    
    func nodesBeforeAndAfter(index: Int) -> (node?, node?) {
        assert(index >= 0)
        
        var i = index
        var next = head
        var prev: node?
        
        while next != nil && i > 0 {
            i -= 1
            prev = next
            next = next!.next
        }
        assert(i == 0)
        
        return (prev, next)
    }
    
    func insertNode(_ value: T, atIndex index: Int) {
        let (prev, next) = nodesBeforeAndAfter(index: index)
        let newNode = LinkedListNode<T>(value: value)
        newNode.prev = prev
        newNode.next = next
        next?.prev = newNode
        prev?.next = newNode
        
        if prev == nil {
            head = newNode
        }
    }
    
    func removeAll() {
        head = nil
    }
    
    func remove(node: node) -> T {
        let prev = node.prev
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.prev = prev
        
        node.prev = nil
        node.next = nil
        return node.value
    }
    
    func reverse() {
        var node = head
        tail = node // If you had a tail pointer
        while let currentNode = node {
            node = currentNode.next
            swap(&currentNode.next, &currentNode.prev)
            head = currentNode
        }
    }
}

class Solution {
    func addTwoNumbers(_ l1: LinkedListNode<Int>?, _ l2: LinkedListNode<Int>?) -> LinkedListNode<Int>? {
        let head = LinkedListNode<Int>(value: 0)
        var current = head
        var carry = 0
        var p = l1
        var q = l2
        while p != nil || q != nil {
            let x = p?.value
            let y = q?.value
            let sum = carry + x! + y!
            carry = sum/10
            let newNode = LinkedListNode<Int>(value: sum % 10)
            current.next = newNode
            current = newNode
            if p != nil {
                p = p?.next
            }
            if q != nil {
                q = q?.next
            }
        }
        if carry > 0 {
            let newNode = LinkedListNode<Int>(value: carry)
            current.next = newNode
        }
        return head.next
    }
}

var list = LinkedList<String>()
list.addToList(value: "first")
list.addToList(value: "second")

list.isEmpty
list.last?.value
list.count
list.nodeAtIndex(1)?.value
list[1]
list.insertNode("between", atIndex: 1)
list.count

//let sol = Solution()
//sol.addTwoNumbers(<#T##l1: LinkedListNode<Int>?##LinkedListNode<Int>?#>, <#T##l2: LinkedListNode<Int>?##LinkedListNode<Int>?#>)


class Solution1 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = [String: [String]]()
        for str in strs {
            let sortedString = String(Array(str.characters).sorted())
            print(sortedString)
            if var val = dict[sortedString] {
                val.append(str)
                dict[sortedString] = val
                print(dict)
            }
            else {
                dict[sortedString] = [str]
                print(dict)
            }
        }
        return Array(dict.values)
    }
}
let sol = Solution1()
sol.groupAnagrams(["eat","tea","tan","ate","nat","bat"])


