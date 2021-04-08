//
//  CourseSchedule2.swift
//  AlgorithmsDataStructures
//
//  Created by Adriano Gaiotto de Oliveira on 2021-04-07.
//

import Foundation

func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    
    var adj = [[Int]](repeating: [Int](), count: numCourses)
    
    var indegree = [Int](repeating: 0, count: numCourses)
    
    var checkCourse = [Bool](repeating: false, count: numCourses)
    
    var tookCourse = [Int]()
    
    for edge in prerequisites {
        let u = edge[0]
        let v = edge[1]
        adj[v].append(u) // DAG
        indegree[u] += 1
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
        tookCourse.append(u)
        for v in adj[u] {
            indegree[v] -= 1 // decrement indegree of all connected vertices from u
            if indegree[v] == 0 {
                q.enqueue(item: v)
            }
        }
    }
    
    if checkCourse.contains(false) && prerequisites != [] {
        return []
    } else {
        return tookCourse
    }
}
