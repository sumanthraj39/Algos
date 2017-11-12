//: Playground - noun: a place where people can play

import UIKit

class TernaryTreeNode<T> {
    //value
    var data: T?
    // identify node
    var key: Character
    
    var left: TernaryTreeNode?
    var right: TernaryTreeNode?
    var middle: TernaryTreeNode?
    
    var hasData: Bool
    
    init(key: Character) {
        self.data = nil
        self.key = key
        self.hasData = self.data != nil
    }
    
    init(key: Character, data: T?) {
        self.key = key
        self.data = data
        self.hasData = (data != nil)
    }
}

class TernarySearchTree<T> {
    
    var root: TernaryTreeNode<T>?
    
    public init() {}
    
    func insert(data:T, key: String ) -> Bool {
        return insert(node: &root, data: data, key: key, charIndex:0)
    }
    
    fileprivate func insert(node: inout TernaryTreeNode<T>?,data:T, key:String, charIndex:Int ) -> Bool {
        
        guard key.characters.count > 0 else {
            return false
        }
        
        if node == nil {
            let i = key.index(key.startIndex, offsetBy: charIndex)
            node = TernaryTreeNode(key: key[i])
        }
        
        let i = key.index(key.startIndex, offsetBy: charIndex)
        if key[i] > node!.key {
            return insert(node: &node!.right, data: data, key: key, charIndex: charIndex)
        }
        
        else if key[i] < node!.key {
            return insert(node: &node!.left, data: data, key: key, charIndex: charIndex)
        }
        
        else {
            if charIndex + 1 < key.characters.count {
                return insert(node: &node!.middle, data: data, key: key, charIndex: charIndex + 1)
            }
            else {
                node?.hasData = true
                node!.data = data
                return true
            }
        }
    }
    
    func find(key: String) -> T? {
        return find(node: root, key: key, charIndex: 0)
    }
    
    fileprivate func find(node:TernaryTreeNode<T>?, key: String, charIndex:Int) -> T? {
        
        guard let n = node else {
            return nil
        }
        
        let index = key.index(key.startIndex, offsetBy: charIndex)
        if key[index] < n.key {
            return find(node: n.left, key: key, charIndex: charIndex)
        }
        else if key[index] > n.key {
            return find(node: n.right, key: key, charIndex: charIndex)
        }
        else {
            if charIndex + 1 < key.characters.count {
                return find(node: n.middle, key: key, charIndex: charIndex + 1)
            }
            else {
                return node!.data
            }
        }
    }
}



  //Definition for a binary tree node.
  public class TreeNode {
      public var val: Int
      public var left: TreeNode?
      public var right: TreeNode?
      public init(_ val: Int) {
          self.val = val
          self.left = nil
    self.right = nil
    }
  }
 
struct Stack<TreeNode> {
    var array = [TreeNode]()
    
    mutating func push(_ node: TreeNode) {
        array.append(node)
    }
    
    mutating func pop() -> TreeNode? {
        return array.popLast()
    }
    
    var isEmpty: Bool {
        return array.count != 0
    }
}


//class Solution {
//    func longestPalindrome(_ s: String) -> String {
//        var start = 0
//        var end = 0
//        
//        for (i,_) in s.characters.enumerated(){
//            let length1 = expand(s, i, i)
//            let length2 = expand(s, i, i + 1)
//            let length = length1 > length2 ? length1 : length2
//            if length > end - start {
//                start = i - ( length - 1 ) / 2
//                end = i + length / 2
//            }
//        }
//        let st = s.index(s.startIndex, offsetBy: start)
//        let e = s.index(s.startIndex, offsetBy: end)
//        let myRange = st..<e
//        
//        return s.substring(with: myRange)
//    }
//    
//    func expand(_ str: String, _ l:Int, _ r: Int) -> Int {
//        var lef = l
//        var righ = r
//        var s = str
//        while lef >= 0 && righ < s.characters.count && s[s.index(s.startIndex, offsetBy: lef)] == s[s.index(s.endIndex, offsetBy: righ)] {
//            lef -= 1
//            righ += 1
//        }
//        return righ - lef - 1
//    }
//}
//
//let s = Solution()
//s.longestPalindrome("abba")














class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        
        var minimum = Int.max
        for str in strs {
            minimum = minimum < str.characters.count ? minimum : str.characters.count
        }
        
        var low = 0
        var high = minimum
        
        while low <= high {
            var middle = (low + high) / 2
            if (isCommonPrefix(strs, middle)) {
                low = middle + 1
            }
            else {
                high = middle - 1
            }
        }
        var index = strs[0].index(strs[0].startIndex, offsetBy: (low + high) / 2)
        let range = strs[0].startIndex..<index
        return strs[0].substring(with: range)
    }
    
    func isCommonPrefix(_ strs: [String], _ length: Int) -> Bool {
        var index = strs[0].index(strs[0].startIndex, offsetBy: length)
        let range = strs[0].startIndex..<index
        var pre = strs[0].substring(with: range)
        for s in strs {
            if s.range(of:pre) == nil {
                return false
            }
        }
        return true
    }
}

let sol = Solution()
sol.longestCommonPrefix(["hie","hi","hello"])

