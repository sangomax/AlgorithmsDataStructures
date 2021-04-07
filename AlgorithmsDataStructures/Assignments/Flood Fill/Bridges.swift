//
//  Bridges.swift
//  AlgorithmsDataStructures
//
//  Created by Adriano Gaiotto de Oliveira on 2021-04-06.
//

import Foundation

func bridges() {
    struct Square {
        let x: Int
        let y: Int
    }
    
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    let n = Int(readLine()!)!
    
    var countryMap = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    var coloredMap = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    
    for r in 0..<n {
        let row = readLine()!.split(separator: " ")
        for c in 0..<n {
            countryMap[r][c] = Int(row[c])!
        }
    }
    
    func bfsIslands(square: Square, id: Int) {
        let q = Queue<Square>()
        q.enqueue(item: square)
        coloredMap[square.x][square.y] = id
        
        while !q.isEmpty() {
            let sq = q.dequeue()!
            let x = sq.x
            let y = sq.y
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                // check the bounds
                if isValidCoordinates(x: nx, y: ny, n: n){
                    if (countryMap[nx][ny] == 1 && coloredMap[nx][ny] == 0) { // check if there's a house
                        q.enqueue(item: Square(x: nx, y: ny))
                        coloredMap[nx][ny] = id
                    }
                }
            }
        }
    }
    
    func bfsBridges(square: Square, idIsland: Int) {
        
        let x = square.x
        let y = square.y
        
        for i in 0..<4 {
            
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if isValidCoordinates(x: nx, y: ny, n: n) && countryMap[nx][ny] != 1 {
                
                buildBridge(x: nx, y: ny, prevX: x, prevY: y, id: idIsland)
                
            }
        }
    }
    
    func isValidCoordinates(x: Int, y: Int, n: Int) -> Bool {
        
        if x >= 0 && x < n && y >= 0 && y < n {
            return true
        }
        return false
    }
    
    
    func buildBridge(x nx: Int, y ny: Int, prevX x: Int, prevY y: Int, id idIsland: Int ) {
        
        for j in 0..<4 {
            var count = 1
            var bx = nx
            var by = ny
            let tempX = bx + dx[j]
            let tempY = by + dy[j]
            
            if isValidCoordinates(x: tempX, y: tempY, n: n)
                && (x != tempX || y != tempY) {
                
                while coloredMap[bx][by] == 0 {
                    count += 1
                    bx += dx[j]
                    by += dy[j]
                    if bx < 0 || bx >= n || by < 0 || by >= n {
                        break
                    } else {
                        if foundEarth(x: bx, y: by, id: idIsland, sizeBridge: count) {
                            break
                        }
                    }
                }
                
            }
        }
        
    }
    
    func foundEarth(x bx: Int, y by: Int, id idIsland: Int, sizeBridge count: Int) -> Bool {
        
        for i in 0..<4 {
            let tempX = bx + dx[i]
            let tempY = by + dy[i]
            if tempX >= 0 && tempX < n && tempY >= 0 && tempY < n {
                if coloredMap[tempX][tempY] != 0 && coloredMap[tempX][tempY] != idIsland {
                    bridgesSize.append(count)
                    return true
                }
            }
        }
        return false
        
    }
    
    var id = 0
    var bridgesSize = [Int]()
    for x in 0..<n {
        for y in 0..<n {
            if countryMap[x][y] == 1 && coloredMap[x][y] == 0 {
                id += 1
                bfsIslands(square: Square(x: x, y: y), id: id)
            }
        }
    }
    
    for x in 0..<n {
        for y in 0..<n {
            if countryMap[x][y] == 1 {
                bfsBridges(square: Square(x: x, y: y), idIsland: coloredMap[x][y])
            }
        }
    }
    
    print(bridgesSize.sorted()[0])
    
    
}
