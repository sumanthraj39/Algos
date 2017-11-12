//: Playground - noun: a place where people can play

import UIKit
public class BinarySearchTree<T: Comparable> {
    var value: T
    
    init(_ value: T) {
        self.value = value
    }
    var parent: BinarySearchTree?
    var left: BinarySearchTree?
    var right: BinarySearchTree?
    
    var isParent: Bool {
        return parent == nil
    }
    
    var isLeftChild: Bool {
        return parent?.left === self
    }
    
    var isRightChild: Bool {
        return parent?.right === self
    }
    
    
    func insert(_ value: T) {
        if value < self.value {
            if let l = left {
                l.insert(value)
            }
            else {
                let new = BinarySearchTree(value)
                left = new
                left?.parent = self
            }
        }
        else {
            if let r = right {
                r.insert(value)
            }
            else {
                let new = BinarySearchTree(value)
                right = new
                right?.parent = self
            }
        }
    }
}