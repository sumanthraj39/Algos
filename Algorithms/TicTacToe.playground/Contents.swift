//: Playground - noun: a place where people can play

import UIKit

class TicTacToe {
    
    var rows = [Int]()
    var cols = [Int]()
    
    init(_ rows: Int, _ cols: Int) {
        self.rows = Array<Int>(repeating: 0, count: rows)
        self.cols = Array<Int>(repeating: 0, count: cols)
    }
    
    var diaG = 0
    var aDiag = 0
    
    
    func move(_ player: Int, _ row: Int, _ col: Int) -> Int {
        
        let player = player == 1 ? 1 : -1
        
        rows[row] += player
        cols[col] += player
        
        if row == col {
            diaG += player
        }
        
        if col == cols.count - 1 - row {
            aDiag += player
        }
        if abs(rows[row]) == rows.count || abs(cols[col]) == rows.count || abs(diaG) == rows.count || abs(aDiag) == rows.count {
            return player
        }
      return 0
    }
}

let sol = TicTacToe(3, 3)

sol.move(1, 1, 1)
sol.move(1, 0, 0)

sol.move(1,2,2)


