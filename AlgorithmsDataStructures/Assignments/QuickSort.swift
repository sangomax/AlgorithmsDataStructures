//
//  QuickSort.swift
//  AlgorithmsDataStructures
//
//  Created by Adriano Gaiotto de Oliveira on 2021-03-14.
//

import Foundation


func quickSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
    
    guard arr.count > 1 else { return arr }
    
    var pivot = arr[arr.count - 1]
    var lessOrEqual = [T]()
    var greater = [T]()
    
    for index in 0...(arr.count - 2) {
        
        if comparator(arr[index], pivot) || arr[index] == pivot {
            lessOrEqual.append(arr[index])
        } else {
            greater.append(arr[index])
        }
    }
    
    var result = quickSort(lessOrEqual, comparator)
    result.append(pivot)
    result.append(contentsOf: quickSort(greater, comparator))
    
    return result
}
