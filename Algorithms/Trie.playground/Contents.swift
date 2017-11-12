//: Playground - noun: a place where people can play

import UIKit

class TrieNode<T: Hashable> {
    
    var value: T?
    var parent: TrieNode?
    var children =  [T:TrieNode]()
    var isTerminating = false
    
    init(_ value: T? = nil, _ parentNode: TrieNode? = nil) {
        self.value = value
        self.parent = parentNode
    }
    
    func add(_ value: T) {
        guard children[value] == nil else {
            return
        }
        children[value] = TrieNode(value, self)
    }
}

class Trie {
    
    var root: TrieNode<Character>
    var wordCount = 0
    
    init(_ root: TrieNode<Character> = TrieNode<Character>()) {
        self.root = root
    }
    
    func insert(_ word: String) {
        var current = root
        for char in word.characters {
            if let childNode = current.children[char] {
                current = childNode
            }
            else {
                current.add(char)
                current = current.children[char]!
            }
        }
        
        guard !current.isTerminating else {
            return
        }
        
        wordCount += 1
        current.isTerminating = true
    }
    
    func search(_ word:String) -> Bool {
        var current = root
        for char in word.characters {
            guard let child = current.children[char] else {
                return false
            }
            current = child
        }
        return current.isTerminating
    }
    
    func hasPrefix(_ prefix:String) -> Bool {
        var current = root
        for char in prefix.characters {
            guard let child = current.children[char] else {
                return false
            }
            current = child
        }
        return true
    }
}
