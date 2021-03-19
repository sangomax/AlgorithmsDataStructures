//
//  WhoIsMyParent.swift
//  AlgorithmsDataStructures
//
//  Created by Adriano Gaiotto de Oliveira on 2021-03-18.
//

import Foundation

func whoIsMyParent() {
    let n = Int(readLine()!)!
    //    var input = [Int](repeating: 0, count: (n - 1))
    var input = [Int](repeating: 0, count: (n / 2 + 2) * 2 - 1)
    
    var parent = 0
    var child = 0
    
    for _ in 0..<(n-1) {
        
        let nodeInfo = readLine()!.split(separator: " ").map { String($0) }
        
        if !nodeInfo.contains("1"){
            for i in 0..<input.count {
                if Int(nodeInfo[0])! == input[i] {
                    child = Int(nodeInfo[1])!
                } else if Int(nodeInfo[1])! == input[i]{
                    child = Int(nodeInfo[0])!
                } else {
                    continue
                }
                
                if(input[i * 2 + 1] == 0) {
                    input[i * 2 + 1] = child
                } else {
                    input[i * 2 + 2] = child
                }
                break
            }
        } else {
            if Int(nodeInfo[0])! == 1 {
                child = Int(nodeInfo[1])!
            } else {
                child = Int(nodeInfo[0])!
            }
            input[0] = 1
            if(input[2 * 1 - 1] == 0) {
                input[2 * 1 - 1] = child
            } else {
                input[2 * 1] = child
            }
        }
    }
    
    print()
    var pt = [Int](repeating: 0, count: (n - 1))
    pt = searchParents(input, 0, &pt)
    
    for i in 2...pt.count + 1 {
        print(pt[i-2])
    }
}

func searchParents(_ tree: [Int],_ node: Int,_ parentTree: inout [Int]) -> [Int] {
    if (node * 2 + 1) < tree.count {
        if(tree[node * 2 + 1] != 0) {
            parentTree[(tree[node * 2 + 1] - 2)] = tree[node]
            parentTree = searchParents(tree, node * 2 + 1, &parentTree)
        }
    }
    if (node * 2 + 2) < tree.count {
        if(tree[node * 2 + 2] != 0) {
            parentTree[(tree[node * 2 + 2] - 2)] = tree[node]
            parentTree = searchParents(tree, node * 2 + 2, &parentTree)
        }
    }
    
    return parentTree
}
