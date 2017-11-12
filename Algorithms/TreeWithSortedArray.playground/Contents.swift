//: Playground - noun: a place where people can play

import UIKit

class TreeNode {
    var value: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ value: Int) {
        self.value = value
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard nums.count > 0 else {
            return nil
        }
        
        return recursion(nums, 0, nums.count - 1, "mid")
        
    }
    
    func recursion(_ nums: [Int], _ low: Int, _ high: Int, _ str: String) -> TreeNode? {
        if low > high  {
            print("called nil \(low) \(high)")
            return nil
        }
        let low = low
        let high = high
        let mid = (low + high) / 2
        let node =  TreeNode(nums[mid])
        print(str, node.value, low, high)
        node.left = recursion(nums, low, mid - 1, str + " left")
        node.right = recursion(nums, mid + 1, high, str + " right")
        print("done")
        return node
    }
}

//var sol = Solution()
//
//sol.sortedArrayToBST([0,1,3,7,8,9,10])


class SolutionPath {
    var mArray = [[Int]]()
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        recursion(root, sum, temp:[])
        return mArray
    }
    
    func recursion (_ root : TreeNode? , _ sum: Int , temp: [Int] ) {
        var tempArr = temp
        if root == nil {
            return
        }
        tempArr.append(root!.value)
        if root?.left == nil && root?.right == nil && sum == root!.value {
            mArray.append(tempArr)
        }
        recursion(root?.left, sum - root!.value, temp: tempArr)
        recursion(root?.right, sum - root!.value, temp: tempArr)
        tempArr.popLast()
    }
}

//var solPath = SolutionPath()
//
//solPath.pathSum([5,4,8,11,nil,13,4,7,2,nil,nil,5,1], 21)

class SolutionMinDepth {
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        let l = minDepth(root?.left)
        let r = minDepth(root?.right)
        
        return (l == 0 || r == 0) ? l + r + 1 : (l < r ? l : r) + 1
        
    }
}

//let sol = SolutionMinDepth()
//
//sol.minDepth()


class SolutionDFS {
    var visited = [[Bool]]()
    func exist(_ board: [[String]], _ word: String) -> Bool {
        guard board.count > 0 else {
            return false
        }
        for (i,arr) in board.enumerated() {
            for (j,_) in arr.enumerated() {
                if seeAdjacent(board, i, j, word, 0) {
                    return true
                }
            }
        }
        return false
    }
    
    func seeAdjacent(_ board: [[String]], _ r:Int, _ c:Int, _ word: String, _ lengthDone: Int) -> Bool {
        if lengthDone == word.characters.count{
            print("r")
            return true
        }
        print(r,c, lengthDone, board[r].count, board[r][c] )
        if c < 0 || r < 0 || c >= board[r].count || r >= board.count || board[r][c] != String(word[word.index(word.startIndex, offsetBy: lengthDone)]){
            
            return false
        }
        print("h")
        
        
        
        if seeAdjacent(board, r + 1, c,word, lengthDone + 1) || seeAdjacent(board, r , c + 1,word, lengthDone + 1) || seeAdjacent(board, r - 1, c,word, lengthDone + 1) || seeAdjacent(board, r , c - 1,word, lengthDone + 1) {
            return true
        }
        //visited[r][c] = false
        return false
        
    }
}

let soldfs = SolutionDFS()

soldfs.exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED")


