//
//  Diameter.swift
//  AlgorithmsDataStructures
//
//  Created by Adriano Gaiotto de Oliveira on 2021-03-18.
//

import Foundation

func diameter() {
    
    var n = Int(readLine()!)!
    
    if (n % 2 == 1) { n += 1 }
    
    var allEdges = [[[Int]]](repeating: [[]], count: (n / 2 + 2) * 2 - 1)
    
    
    for _ in 0..<(n-1) {
        
        let nodeInfo = readLine()!.split(separator: " ").map { String($0) }
        
        let mainNode = Int(nodeInfo[0])!
        var node = 0
        var distance = 0
        
        for i in 1..<nodeInfo.count - 1 {
            if ( i % 2 == 1) {
                node = Int(nodeInfo[i])!
            } else {
                distance = Int(nodeInfo[i])!
                if(allEdges[mainNode][0].count == 0) {
                    allEdges[mainNode][0] = [node,distance]
                } else {
                    allEdges[mainNode].append([node,distance])
                }
            }
        }
        
    }
    
    var sum = 0
    print(dfs(allEdges,node: 1, arrival: 0, sum))
}

func dfs(_ list: [[[Int]]], node: Int, arrival: Int,_ sum: Int) -> Int{
    
    if list[node][0].count == 0 {
        return sum
    }
    
    var newSum = [Int](repeating: 0, count: list[node].count)
    
    for i in 0..<list[node].count {
        
        if list[node][i][0] != arrival {
            newSum[i] = list[node][i][1]
            newSum[i] = dfs(list, node: list[node][i][0], arrival: node, newSum[i] + sum)
        } else {
            newSum[i] = sum
        }
        
    }
    
    var sumReturn = [Int]()
    var sumNodes = 0
    
    for s in 0..<newSum.count {
        sumReturn.append(newSum[s])
        sumNodes += newSum[s] - sum
    }
    sumReturn.append(sumNodes)
    
    return whoIsGreater(sumReturn)
}

func whoIsGreater(_ nums: [Int]) -> Int {
    var greater = nums[0]
    for i in 1...nums.count - 1 {
        if nums[i] > greater {
            greater = nums[i]
        }
    }
    return greater
}
 
