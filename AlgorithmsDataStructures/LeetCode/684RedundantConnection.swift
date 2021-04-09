//
//  684RedundantConnection.swift
//  AlgorithmsDataStructures
//
//  Created by Adriano Gaiotto de Oliveira on 2021-04-08.
//

import Foundation

func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        
    var t = UF(edges.count + 1)
    
    var result = [Int]()
    
    for edge in edges {
        
        if t.connected(edge[0], edge[1]) {
            result = edge
        } else {
            t.union(edge[0], edge[1])
        }
        
    }
    
    return result
}
