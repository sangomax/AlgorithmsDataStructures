//
//  BellmanFord.swift
//  AlgorithmsDataStructures
//
//  Created by Derrick Park on 2021-04-13.
//

import Foundation

func generalShortestPath() {
  /// Bellmand-Ford shortest path algorithm
  /// Time complexity: O(VE)
  /// - Parameters:
  ///   - edges: edge list
  ///   - n: the number of vertices from 1 to n
  ///   - src: the source vertex
  /// - Returns: the shortest distance array
  let inf = 1000000

  func bellmanFord(_ edges: [(u: Int, v: Int, w: Int)], _ n: Int, _ src: Int) -> [Int] {
    var dist = [Int](repeating: inf, count: n + 1) // 1-indexed
    dist[src] = 0
    
    // N - 1 times
    for _ in 0..<n-1 {
      // relax all edges
      for edge in edges {
        if dist[edge.v] > dist[edge.u] + edge.w {
          dist[edge.v] = dist[edge.u] + edge.w
        }
      }
    }
    
    return dist
  }

  struct Edge {
    let to: Int
    let weight: Int
  }
  
  // SPFA (Shortest Path Faster Algorithm)
  func shortestPathFasterAlgorithm(_ adj: [[Edge]], _ n: Int, _ src: Int) -> [Int] {
    var dist = [Int](repeating: inf, count: n + 1) // 1-indexed
    var check = [Bool](repeating: false, count: n + 1)
    let q = Queue<Int>()
    q.enqueue(item: src)
    dist[src] = 0
    check[src] = true
    
    while !q.isEmpty() {
      let from = q.dequeue()!
      check[from] = false
      for edge in adj[from] {
        if dist[edge.to] > dist[from] + edge.weight {
          dist[edge.to] = dist[from] + edge.weight
          if !check[edge.to] {
            q.enqueue(item: edge.to)
            check[edge.to] = true
          }
        }
      }
    }
    
    return dist
  }
}
