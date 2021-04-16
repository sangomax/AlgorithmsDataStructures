//
//  MinimumCostFlow.swift
//  AlgorithmsDataStructures
//
//  Created by Adriano Gaiotto de Oliveira on 2021-04-14.
//

import Foundation


struct CompPipe {
    var u: Int
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


func startMCF(_ input: [String.SubSequence]) -> Int {
    //func startMCF() {
    
    //        let firstLine = readLine()!.split(separator: " ")
    let firstLine = input[0].split(separator: " ")
    
    let n = Int(firstLine[0])!
    let m = Int(firstLine[1])!
    let d = Int(firstLine[2])!
    
    var pipes = [[(v: Int, w: Int, act: Bool)]](repeating: [], count: n + 1)
    
    for i in 0..<m {
        
        //            let pipe = readLine()!.split(separator: " ")
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
    
    let days = kruskalMST(pipes, n, m, d)
    //        print(days)
    return days
}

public func kruskalMST(_ graph: [[(v: Int, w: Int, act: Bool)]], _ n: Int,_ m: Int,_ d: Int ) -> Int {
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
    
    var largest = 0
    var index = 0
    var count = 0
    var sumCosts = 0
    for p in mstEdges {
        if p.2 > largest {
            index = count
            largest = p.2
        }
        count += 1
        sumCosts += p.w
    }
    
    if mstEdges[index].w >= d {
        sumCosts -= d
    } else {
        sumCosts -= mstEdges[index].w
    }
    
    var dayReduction = 0
    
    if !mstEdges[index].act {
        
        var edgeSkip = [CompPipe]()
        edgeSkip.append(CompPipe(u: mstEdges[index].u, v: mstEdges[index].v, w: mstEdges[index].w, act: mstEdges[index].act))
        
        while m > ( mstEdges.count - 1 + edgeSkip.count ) {
            
            var mstEdges2 = [(u: Int, v: Int, w: Int, act: Bool)]()
            var uf2 = UF(graph.count)
            for edge in allEdges {
                if uf2.connected(edge.u, edge.v) { continue }
                if !edgeSkip.contains(CompPipe(u: edge.u, v: edge.v, w: edge.w, act: edge.act))  {
                    uf2.union(edge.u, edge.v)
                    mstEdges2.append(edge)
                }
            }
            
            if mstEdges.count == mstEdges2.count {
                
                var sumCosts2 = 0
                var largest2 = 0
                var index2 = 0
                var count2 = 0
                for p in mstEdges2 {
                    if p.2 > largest2 {
                        index2 = count2
                        largest2 = p.2
                    }
                    count2 += 1
                    sumCosts2 += p.w
                }
                
                if mstEdges2[index2].act {
                    
                    if mstEdges2[index2].w >= d {
                        sumCosts2 -= d
                    } else {
                        sumCosts2 -= mstEdges2[index2].w
                    }
                    
                    if sumCosts == sumCosts2 {
                        dayReduction = 1
                        break
                    } else {
                        edgeSkip.append(CompPipe(u: mstEdges2[index2].u, v: mstEdges2[index2].v, w: mstEdges2[index2].w, act: mstEdges2[index2].act))
                    }
                    
                } else {
                    edgeSkip.append(CompPipe(u: mstEdges2[index2].u, v: mstEdges2[index2].v, w: mstEdges2[index2].w, act: mstEdges2[index2].act))
                }
                
            } else {
                break
            }
            
        }
        
    }
    
    var num = mstEdges.map { $0.act == false ? 1 : 0 }.reduce(0, +)
    
    num -= dayReduction
    
    
    return num
}
