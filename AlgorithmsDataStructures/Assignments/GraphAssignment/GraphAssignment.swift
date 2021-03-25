//
//  GraphAssignment.swift
//  AlgorithmsDataStructures
//
//  Created by Adriano Gaiotto de Oliveira on 2021-03-24.
//

import Foundation


func CyclicPermutation() {
    let numberTestCase = Int(readLine()!)!
    
    for _ in 0..<numberTestCase {
        
        let n = Int(readLine()!)!
        var adjList = [Int](repeating: 0, count: n + 1)
        let permutation = readLine()!.split(separator: " ")
        
        for i in 0..<n {
            adjList[i + 1] = Int(permutation[i])!
        }
        
        var visited = [Bool](repeating: false, count: n + 1)
        var count = 0
        
        for v in 1...n {
            if !visited[v] {
                dfs(vertex: v, adjList: &adjList, visited: &visited)
                count += 1
            }
        }
        
        print(count)
        
    }
}

func dfs(vertex: Int, adjList: inout [Int], visited: inout [Bool]) {
    visited[vertex] = true
    let node = adjList[vertex]
    if !visited[node] {
        dfs(vertex: node, adjList: &adjList, visited: &visited)
    }
}


func RepeatingSequence() {
    
    let inputInfo = readLine()!.split(separator: " ")
    
    var A = String(inputInfo[0])
    let P = Int(inputInfo[1])!
    var sumDigits = Int(A)!
    
    var index = -1
    var preIndex = -1
    var listSequence: [Int] = []
    var listIndexRepeating: [Int] = []
    
    while(!listIndexRepeating.contains(index)) {
        
        listSequence.append(sumDigits)
        sumDigits = 0
        
        if index >= 0 {
            listIndexRepeating.append(index)
            preIndex = index
        }
        
        let allDigits = A.map { String($0) }
        
        for digit in allDigits {
            sumDigits += power(base: Int(digit)!, exponent: P)
        }
        
        if listSequence.contains(sumDigits) {
            index = linearSearch(listSequence, sumDigits)!
            if preIndex != -1 && preIndex != (index - 1) && !listIndexRepeating.contains(index) {
                listIndexRepeating = []
            }
        }
        
        
        A = String(sumDigits)
        
    }
    
    var count = 0
    for _ in 0..<listIndexRepeating[0] {
        count += 1
    }
    
    print(count)
    
}

func linearSearch<T: Equatable>(_ collection: [T], _ target: T) -> Int? {
  for (index, element) in collection.enumerated() where element == target {
    return index
  }
  return -1
}
