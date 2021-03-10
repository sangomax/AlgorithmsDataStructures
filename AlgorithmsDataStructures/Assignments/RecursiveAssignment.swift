//
//  Recursion.swift
//  AlgorithmsDataStructures
//
//  Created by Adriano Gaiotto de Oliveira on 2021-03-09.
//

import Foundation

func evaluate(_ mathExpression: String, pos: Int) -> (Int,Int) {
    var skip = pos
    if let num = Int(mathExpression[skip]) {
        return (num, skip)
    } else {
        if(mathExpression[pos] == "(") {
            skip += 1
        }
        var first = 0
        (first, skip)  = evaluate(mathExpression, pos: skip)
        skip += 1
        switch mathExpression[skip] {
        case "+":
            skip += 1
            var second = 0
            (second, skip) = evaluate(mathExpression, pos: skip)
            skip += 1
            return (first + second, skip )
        default:
            skip += 1
            var second = 0
            (second, skip) = evaluate(mathExpression, pos: skip)
            skip += 1
            return (first * second, skip)
        }
    }
}
