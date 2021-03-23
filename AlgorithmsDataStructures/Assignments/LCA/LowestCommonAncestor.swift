//
//  LowestCommonAncestor.swift
//  AlgorithmsDataStructures
//
//  Created by Adriano Gaiotto de Oliveira on 2021-03-22.
//

import Foundation

func LCA() {
    
    let n = Int(readLine()!)!
    
    var edges = [[Int]](repeating: [], count: n+1)
    
    
    for _ in 0..<n-1 {
        
        let nodeInfo = readLine()!.split(separator: " ").map { String($0) }
        
        let first = Int(nodeInfo[0])!
        let second = Int(nodeInfo[1])!
        
        
        edges[first].append(second)
        edges[second].append(first)
        
    }
    
    let m = Int(readLine()!)!
    
    for _ in 0..<m {
        
        let nodeInfo = readLine()!.split(separator: " ").map { String($0) }
        
        print(searchLCA(edges, Int(nodeInfo[0])!, Int(nodeInfo[1])!))
        
    }
    
}


func searchLCA(_ tree: [[Int]], _ node1: Int, _ node2: Int) -> Int {
    
    var x = node1
    var y = node2
    
    while (x != y ) {
        if x > y {
            
            x = tree[x].min()!
            
        } else {
            
            y = tree[y].min()!
            
        }
    }
    
    return x
}
