//
//  547NumberOfProvinces.swift
//  AlgorithmsDataStructures
//
//  Created by Adriano Gaiotto de Oliveira on 2021-04-08.
//

import Foundation

func findCircleNum(_ isConnected: [[Int]]) -> Int {
    
    var t = UF(isConnected.count)
    
    var connected = isConnected.count
        
    for i in 0..<isConnected.count {
        
        for j in 0..<isConnected[i].count {
            
            if i == j {
                continue
            }
            
            if !t.connected(i, j) {
                if isConnected[i][j] == 1 {
                    t.union(i, j)
                    connected -= 1
                }
            }
        }
        
    }
        
        return connected
}
