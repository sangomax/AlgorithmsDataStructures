//
//  FindCityWithSmallestNumberNeighborsThresholdDistance.swift
//  AlgorithmsDataStructures
//
//  Created by Adriano Gaiotto de Oliveira on 2021-04-19.
//

import Foundation

func findTheCity(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
        
     
    var dist = [[Int]](repeating: [Int](repeating: 10001, count: n + 1), count: n + 1)
     
    for edge in edges {
        dist[edge[0]][edge[1]] = edge[2]
        dist[edge[1]][edge[0]] = edge[2]
    }
    
    for i in 0..<n {
        dist[i][i] = 0
    }
    
    for k in 0...n {
        for i in 0...n {
            for j in 0...n {
                dist[i][j] = min(dist[i][j], dist[i][k] + dist[k][j])
            }
        }
    }
    
    var neighbors = [Int](repeating: 0, count: n + 1)
    
    for u in 0..<n {
        var s = 0
        for w in dist[u] {
            if 0 < w && w <= distanceThreshold {
                s += 1
            }
        }
        neighbors[u] = s
    }
    
    var target = 0
      
    for i in 0..<n {
        if neighbors[i] <= neighbors[target] {
                    target = i
        }
    }
            
    return target
    
}
