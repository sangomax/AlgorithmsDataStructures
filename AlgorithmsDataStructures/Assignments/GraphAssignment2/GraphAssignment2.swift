//
//  GraphAssignment2.swift
//  AlgorithmsDataStructures
//
//  Created by Adriano Gaiotto de Oliveira on 2021-03-25.
//

import Foundation

func SushiRestaurantReviews() {
    
    let firstLine = readLine()!.split(separator: " ")
    
    let n = Int(firstLine[0])!
    let m = Int(firstLine[1])!
    
    let inputRestaurants = readLine()!.split(separator: " ")
    var sushiRestaurants = [Int]()
    
    var adjList = [[Edge]](repeating: [], count: n)
    
    for r in 0..<m {
        sushiRestaurants.append(Int(inputRestaurants[r])!)
    }
    
    for i in 0..<n - 1 {
        
        let edge = readLine()!.split(separator: " ")
        
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        
        adjList[u].append(Edge(to: v, distance: 1))
        adjList[v].append(Edge(to: u, distance: 1))
        
    }
    
    var start = sushiRestaurants[0]
    var distances = [Int](repeating: 0, count: n + 1)
    var check = [Bool](repeating: false, count: n + 1)
    bfs(node: start, check: &check, distances: &distances, adjList: &adjList, nextNode: -1)
    
    for i in 1...n-1 {
        if distances[i] > distances[start] && sushiRestaurants.contains(i){
            start = i
        }
    }
    
    distances = [Int](repeating: 0, count: n + 1)
    check = [Bool](repeating: false, count: n + 1)
    
    bfs(node: start, check: &check, distances: &distances, adjList: &adjList, nextNode: -1)
    orderRestaurants(distanceFromStart: distances, restaurants: &sushiRestaurants)
    
    var count = 0
    for res in 0..<sushiRestaurants.count - 1{
        var distances2 = [Int](repeating: 0, count: n + 1)
        var check2 = [Bool](repeating: false, count: n + 1)
        bfs(node: sushiRestaurants[res], check: &check2, distances: &distances2, adjList: &adjList, nextNode: sushiRestaurants[res + 1])
        count += distances2[sushiRestaurants[res + 1]]
    }
    
    print(count)
}

struct Edge: Comparable {
    static func < (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.distance < rhs.distance
    }
    
    let to: Int
    let distance: Int
}

func bfs(node: Int, check: inout [Bool], distances: inout [Int], adjList: inout [[Edge]], nextNode: Int) {
    let q = Queue<Int>()
    check[node] = true
    q.enqueue(item: node)
    while !q.isEmpty() {
        let x = q.dequeue()!
        for edge in adjList[x] {
            if !check[edge.to] {
                distances[edge.to] = distances[x] + edge.distance
                q.enqueue(item: edge.to)
                check[edge.to] = true
            }
            if nextNode != -1 && edge.to == nextNode {
                return
            }
        }
    }
}

func orderRestaurants(distanceFromStart: [Int], restaurants: inout [Int]) {
    if restaurants.count == 1 {
        return
    }

    for i in 0..<restaurants.count - 1 {
      for j in 1..<restaurants.count - i {
        if distanceFromStart[restaurants[j]] <= distanceFromStart[restaurants[j - 1]] {
          let temp = restaurants[j-1]
            restaurants[j - 1] = restaurants[j]
            restaurants[j] = temp
        }
      }
    }
}
