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
    
    
    for i in 0..<n-1 {
        
        let nodeInfo = readLine()!.split(separator: " ").map { String($0) }
        
        let first = Int(nodeInfo[0])!
        let second = Int(nodeInfo[1])!
        
        
        //        if first > second {
        edges[first].append(second)
        //        } else {
        edges[second].append(first)
        //        }
        
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
    
    var levelX = 0
    var levelY = 0
    
    while (x != y ) {
        
        if levelX == 0 && levelY == 0 {
            dfs(tree, node: 1, arrival: 1, searchNode: x, level: &levelX)
            dfs(tree, node: 1, arrival: 1, searchNode: y, level: &levelY)
        }
        
        if levelX == levelY {
            levelX = 0
            levelY = 0
            let tempX = dfs(tree, node: 1, arrival: 1, searchNode: x, level: &levelX)
            let tempY = dfs(tree, node: 1, arrival: 1, searchNode: y, level: &levelY)
            if (tempX == y) {
                x = tempX
                continue
            } else if (tempY == x) {
                y = tempY
                continue
            }
            x = tempX
            y = tempY
            
        } else if levelX > levelY {
            levelX = 0
            x = dfs(tree, node: 1, arrival: 1, searchNode: x, level: &levelX)
        } else {
            levelY = 0
            y = dfs(tree, node: 1, arrival: 1, searchNode: y, level: &levelY)
            
        }
    }
    return x
}


func dfs(_ list: [[Int]], node: Int, arrival: Int, searchNode: Int, level: inout Int) -> Int{
    
    if node == searchNode {
        return arrival
    }
    
    for i in 0..<list[node].count {
        
        if list[node][i] != arrival {
            level += 1
            let lastParent = dfs(list, node: list[node][i], arrival: node, searchNode: searchNode, level: &level)
            if lastParent != 1 {
                return lastParent
            } else {
                level -= 1
            }
        }
        
    }
    
    return 1
}
