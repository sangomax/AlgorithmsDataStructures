//
//  CheapestFlightsWithinKStops.swift
//  AlgorithmsDataStructures
//
//  Created by Adriano Gaiotto de Oliveira on 2021-04-18.
//

import Foundation

func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
    
    var adj = [[Flight]](repeating: [], count: n + 1)
    
    for flight in flights {
        
        adj[flight[0]].append(Flight(to: flight[1], price: flight[2], stops: 0))
        
    }
    
    var lowPrice = -1
    
    let flightQueue = Queue<Flight>()
    
    if src <= n {
        for fligth in adj[src] {
            if fligth.to == dst {
                if K == 0 {
                    return fligth.price
                }
                lowPrice = fligth.price
            }
            flightQueue.enqueue(item: Flight(to: fligth.to, price: fligth.price, stops: 0))
        }
    } else {
        return  -1
    }
    
    while flightQueue.count != 0 {
        let flightFrom = flightQueue.dequeue()!
        if src <= n {
            for flight in adj[flightFrom.to] {
                let newPrice = flightFrom.price + flight.price
                let newStops = flightFrom.stops + 1
                if flight.to == dst {
                    if newStops <= K {
                        if lowPrice == -1 || newPrice < lowPrice {
                            lowPrice = newPrice
                        }
                    }
                } else {
                    if newStops < K {
                        if lowPrice == -1 || newPrice <= lowPrice {
                            flightQueue.enqueue(item: Flight(to: flight.to, price: newPrice, stops: newStops))
                        }
                    }
                }
            }
        }
    }
    
    return lowPrice
    
}


public struct Flight {
    let to: Int
    let price: Int
    let stops: Int
}

extension Flight: Comparable {
    public static func <(lhs: Flight, rhs: Flight) -> Bool {
        return lhs.price < rhs.price
    }
}

extension Flight: Hashable {}
