//
//  TomatoFarm.swift
//  AlgorithmsDataStructures
//
//  Created by Adriano Gaiotto de Oliveira on 2021-04-06.
//

import Foundation

func tomateFarm() {
    
    struct Square {
        let x: Int
        let y: Int
    }
    
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    
    
    let firstLine = readLine()!.split(separator: " ")
    
    let n = Int(firstLine[0])!
    let m = Int(firstLine[1])!
    
    var gridShaped = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
    var gridShapedCheck = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
    
    for r in 0..<m {
        let row = readLine()!.split(separator: " ")
        for c in 0..<n {
            gridShaped[r][c] = Int(row[c])!
        }
    }
    
    
    func bfs(square: Square) {
        let x = square.x
        let y = square.y
        for i in 0..<4 {
            let mx = x + dx[i]
            let ny = y + dy[i]
            if mx >= 0 && mx < m && ny >= 0 && ny < n {
                if (gridShaped[mx][ny] == 0) {
                    gridShaped[mx][ny] = 1
                }
            }
        }
    }
    
    let q = Queue<Square>()
    var id = 0
    repeat {
        if q.count > 0 {
            id += 1
            for _ in 0..<q.count {
                let sq = q.dequeue()!
                bfs(square: Square(x: sq.x, y: sq.y))
                gridShapedCheck[sq.x][sq.y] = true
            }
        }
        
        for x in 0..<m {
            for y in 0..<n {
                if gridShaped[x][y] == 1 && gridShapedCheck[x][y] == false {
                    q.enqueue(item: Square(x: x, y: y))
                    
                }
            }
        }
    } while !q.isEmpty()
    
    var checkUnripe = false
    for i in 0..<m {
        if gridShaped[i].contains(0) {
            checkUnripe = true
        }
    }
    
    if checkUnripe {
        print(-1)
    } else {
        print(id - 1)
    }
}
