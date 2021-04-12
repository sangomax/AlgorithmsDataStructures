//
//  134GasStation.swift
//  AlgorithmsDataStructures
//
//  Created by Adriano Gaiotto de Oliveira on 2021-04-11.
//

import Foundation

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    
    var start = 0
    var next = 0
    var total = gas[start]
    
    while true {
        if(total >= cost[next]) {
            total = total - cost[next];
            if next + 1 < gas.count {
                next = (next + 1)
            } else {
                next = 0
            }
            if(start == next) {
                return start;
            }
            total = total + gas[next];
        } else {
            if(next < start) {
                if start + 1 < gas.count {
                    start = (start + 1)
                } else {
                    start = 0
                }
            } else {
                if next + 1 < gas.count {
                    next = (next + 1)
                } else {
                    next = 0
                }
                start = next;
                total = gas[start];
            }
            
            if(start == 0) {
                return -1;
            }
        }
    }
}
