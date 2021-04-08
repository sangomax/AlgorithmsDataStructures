//
//  Course Schedule.swift
//  AlgorithmsDataStructures
//
//  Created by Adriano Gaiotto de Oliveira on 2021-04-07.
//

import Foundation

func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    
    var adj = [[Int]](repeating: [Int](), count: numCourses)
    
    var indegree = [Int](repeating: 0, count: numCourses)
    
    var checkCourse = [Bool](repeating: false, count: numCourses)
    
    for edge in prerequisites {
        let u = edge[0]
        let v = edge[1]
        adj[u].append(v) // DAG
        indegree[v] += 1
    }
    
    // Topological Sort - using BFS (Queue)
    let q = Queue<Int>()
    for v in 0..<numCourses {
        if indegree[v] == 0 {
            q.enqueue(item: v)
        }
    }
    
    // BFS O(V + E)
    while !q.isEmpty() {
        let u = q.dequeue()!
        checkCourse[u] = true
        for v in adj[u] {
            indegree[v] -= 1 // decrement indegree of all connected vertices from u
            if indegree[v] == 0 {
                q.enqueue(item: v)
            }
        }
    }
    
    if checkCourse.contains(false) && prerequisites != [] {
        return false
    } else {
        return true
    }
    
}
