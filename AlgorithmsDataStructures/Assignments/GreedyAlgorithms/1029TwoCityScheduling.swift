//
//  File.swift
//  AlgorithmsDataStructures
//
//  Created by Adriano Gaiotto de Oliveira on 2021-04-10.
//

import Foundation

func twoCitySchedCost(_ costs: [[Int]]) -> Int {
  var sumA = 0
  var diffs = [Int]()
  for cost in costs {
    sumA += cost[0]
    diffs.append(cost[1] - cost[0])
  }
  diffs.sort() // O(N lgN)
  for diff in diffs[0..<diffs.count/2] {
    sumA += diff
  }
  return sumA
}
