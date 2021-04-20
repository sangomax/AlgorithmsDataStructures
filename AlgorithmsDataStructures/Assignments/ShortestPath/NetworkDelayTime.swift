//
//  NetworkDelayTime.swift
//  AlgorithmsDataStructures
//
//  Created by Adriano Gaiotto de Oliveira on 2021-04-18.
//

import Foundation

func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {

    
    func dijkstra(_ adj: inout [[Times]],_ n: Int,_ src: Int) -> [Int] {
      
        var dist = [Int](repeating: 101, count: n + 1)
        var check = [Bool](repeating: false, count: n + 1)
        
        dist[src] = 0
        check[src] = true
        
        for _ in 1...n {
          // get the min dist vertex
          var min = 101
          var minVertex = src
          for v in 1...n {
            if !check[v] && dist[v] < min {
              min = dist[v]
              minVertex = v
            }
          }
          // relax all neighbor edges
          check[minVertex] = true
          for edge in adj[minVertex] {
            let to = edge.to
            if dist[to] > dist[minVertex] + edge.weight {
              dist[to] = dist[minVertex] + edge.weight
            }
          }
        }
      
      dist[0] = 0
        
      return dist.contains(101) ? [-1] : dist
    }
    
    var adj = [[Times]](repeating: [], count: n + 1)
    
    for time in times {
        
        adj[time[0]].append(Times(to: time[1], weight: time[2]))
        
    }
    
    let timesL = dijkstra(&adj, n, k)
    
    print(timesL)
    
    return timesL.max()!
}

public struct Times {
    let to: Int
    let weight: Int
}

extension Times: Comparable {
  public static func <(lhs: Times, rhs: Times) -> Bool {
    return lhs.weight < rhs.weight
  }
}

extension Times: Hashable {}

