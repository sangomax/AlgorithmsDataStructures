//
//  MinimumCostFlow.swift
//  AlgorithmsDataStructures
//
//  Created by Adriano Gaiotto de Oliveira on 2021-04-14.
//

import Foundation


struct CompPipe {
    var v: Int
    var w: Int
    var act: Bool
}

extension CompPipe: Comparable {
  public static func <(lhs: CompPipe, rhs: CompPipe) -> Bool {
    return lhs.w < rhs.w
  }
}

extension CompPipe: Hashable {}


func startMCF(_ input: [String.SubSequence], _ ans:  String) -> Int {
//func startMCF() {
    
    let firstLine = readLine()!.split(separator: " ")
//    let firstLine = input[0].split(separator: " ")
    
    let n = Int(firstLine[0])!
    let m = Int(firstLine[1])!
    let d = Int(firstLine[2])!
    
    var pipes = [[(v: Int, w: Int, act: Bool)]](repeating: [], count: n + 1)
    
    for i in 0..<m {
        
//        let pipe = readLine()!.split(separator: " ")
        let pipe = input[1 + i].split(separator: " ")
        
        let a = Int(pipe[0])!
        let b = Int(pipe[1])!
        let c = Int(pipe[2])!
        
        var active = false
        if i < n-1 {
            active = true
        }
        
        pipes[a].append((v: b, w: c, act: active))
        
    }
    
//    print(kruskalMST(pipes, n, m, d))
    return kruskalMST(pipes, n, m, d)
}

public func kruskalMST(_ graph: [[(v: Int, w: Int, act: Bool)]], _ n: Int,_ m: Int,_ d: Int ) -> Int { //(Int, [(Int, Int, Int, Bool)])  {
  var allEdges = [(u: Int, v: Int, w: Int, act: Bool)]()
  var mstEdges = [(u: Int, v: Int, w: Int, act: Bool)]()
  
  for (u, node) in graph.enumerated() {
    for edge in node {
        allEdges.append((u: u, v: edge.v, w: edge.w, edge.act))
    }
  }
    
    
  allEdges.sort { $0.w < $1.w || $0.w == $1.w && $0.act == true }
  
  var uf = UF(graph.count)
  for edge in allEdges {
    if uf.connected(edge.u, edge.v) { continue }
    uf.union(edge.u, edge.v)
    mstEdges.append(edge)
  }
    
    let num = mstEdges.map { $0.act == false ? 1 : 0 }.reduce(0, +)
    
//    if num - Int(ans)! == 1 {
//        return num - 1
//    }
    
    return num
}

//startMCF()
