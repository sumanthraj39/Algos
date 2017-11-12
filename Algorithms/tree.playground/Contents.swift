//: Playground - noun: a place where people can play

import UIKit

class TreeNode<T> {
    var value : T
    var parentNode : TreeNode<T>?
    var childrenNodes = [TreeNode<T>]()
    
    init(value: T){
        self.value = value
    }
    
    func addChild(_ child: TreeNode<T>) {
        childrenNodes.append(child)
        child.parentNode = self
    }
}

extension TreeNode: CustomStringConvertible {
    public var description: String {
        var s = "\(value)"
        if !childrenNodes.isEmpty {
            s += " {" + childrenNodes.map { $0.description }.joined(separator: ", ") + "}"
        }
        return s
    }
}

let node = TreeNode<String>(value : "mallesh")
node.addChild(TreeNode<String>(value : "Halwa"))
node.description
		