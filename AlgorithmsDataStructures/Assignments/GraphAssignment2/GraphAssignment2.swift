//
//  GraphAssignment2.swift
//  AlgorithmsDataStructures
//
//  Created by Adriano Gaiotto de Oliveira on 2021-03-25.
//

import Foundation

//func SushiRestaurantReviews() -> Int {
func SushiRestaurantReviews(_ input: [String.SubSequence]) -> Int {
    
    //    let firstLine = readLine()!.split(separator: " ")
    let firstLine = input[0].split(separator: " ")
    
    let n = Int(firstLine[0])!
    let m = Int(firstLine[1])!
    
    //    let inputRestaurants = readLine()!.split(separator: " ")
    let inputRestaurants = input[1].split(separator: " ")
    var sushiRestaurants = [Int]()
    
    var adjList = [[Edge]](repeating: [], count: n + 1)
    
    for r in 0..<m {
        sushiRestaurants.append(Int(inputRestaurants[r])!)
    }
    
    for i in 0..<n - 1 {
        
        //        let edge = readLine()!.split(separator: " ")
        let edge = input[2 + i].split(separator: " ")
        
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        
        adjList[u].append(Edge(to: v, distance: 1))
        adjList[v].append(Edge(to: u, distance: 1))
        
    }
    
    var start = sushiRestaurants[0]
    
    var distances = [Int](repeating: 0, count: n + 1)
    var check = [Bool](repeating: false, count: n + 1)
    
    bfsStack(node: start, check: &check, distances: &distances, adjList: &adjList, sushiRestaurants: sushiRestaurants)
    
    for i in 0...n-1 {
        if distances[i] > distances[start] && sushiRestaurants.contains(i){
            start = i
        }
    }
    
    var tr = 0
    for i in adjList {
        tr += i.count
    }
    
    check = [Bool](repeating: false, count: n + 1)
    distances = [Int](repeating: 0, count: n + 1)
    
    bfsStack(node: start, check: &check, distances: &distances, adjList: &adjList, sushiRestaurants: sushiRestaurants)
//    orderRestaurants(distanceFromStart: distances, restaurants: &sushiRestaurants)
    for i in 0...n-1 {
        if distances[i] > distances[start] && sushiRestaurants.contains(i){
            start = i
        }
    }
    
    return (tr/2) * 2 - distances[start]
    
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

func bfsStack(node: Int, check: inout [Bool], distances: inout [Int], adjList: inout [[Edge]], sushiRestaurants: [Int]) {
    let q = Stack<Int>()
    var countRest = 1
    q.push(item: node)
    while !q.isEmpty(){
        //        print(q)
        let x = q.peek()!
        check[x] = true
        if adjList[x].count == 1 && check[adjList[x][0].to] && !sushiRestaurants.contains(x) {
            q.pop()
            adjList[adjList[x][0].to].remove(at: findIndex(x, adjList[adjList[x][0].to]))
            adjList[x].remove(at: 0)
        } else if visitedEdges( &check, adjList[x]) {
            q.pop()
        } else {
            
            for edge in adjList[x] {
                if !check[edge.to] {
                    distances[edge.to] = distances[x] + edge.distance
                    q.push(item: edge.to)
                    if sushiRestaurants.contains(edge.to) {
                        countRest += 1
                    }
                }
            }
            
            if countRest == sushiRestaurants.count  {
                
                while !q.isEmpty(){
                    
                    if !check[q.peek()!] {
                        if sushiRestaurants.contains(q.peek()!) {
                            check[q.pop()!] = true
                        } else {
                            q.pop()
                        }
                    } else {
                        q.pop()
                    }
        
                }
                
                break
            }
            
        }
    }
    
//    for _ in 0..<q.count {
//        q.pop()
//    }
    
    for x in 0..<check.count {
        if !check[x] {
            for i in adjList[x] {
                adjList[i.to].remove(at: findIndex(x, adjList[i.to]))
            }
            adjList[x].removeAll()
        }
    }
//    print("\(sushiRestaurants.count) - \(countRest)")
    
}

func findIndex(_ node: Int, _ list: [Edge]) -> Int {
    
    for i in 0..<list.count {
        if list[i].to == node {
            return i
        }
    }
    return -1
}

func visitedEdges(_ check: inout [Bool], _ list: [Edge]) -> Bool {
    var countVisited = 0
    for i in 0..<list.count {
        if check[list[i].to]{
            countVisited += 1
        }
    }
    if list.count == countVisited {
        return true
    } else {
        return false
    }
}
