//
//  763PartitionLabels.swift
//  AlgorithmsDataStructures
//
//  Created by Adriano Gaiotto de Oliveira on 2021-04-11.
//

import Foundation

func partitionLabels(_ S: String) -> [Int] {
    
    var lastChar = [Int](repeating: 0, count: 122 + 1)
        
    var fullString = [Character]()
    for l in 0..<S.count {
        fullString.append(Character(S[l]))
        
        lastChar[Int(fullString[l].asciiValue!)] = l
        
    }
    
    var result = [Int]()
    var count = 0
    var last = lastChar[Int(fullString[0].asciiValue!)]
    var total = 0
    for l in 0..<fullString.count {
        
        if lastChar[Int(fullString[l].asciiValue!)] > last {
            last = lastChar[Int(fullString[l].asciiValue!)]
        }
        
        if last == fullString.count - 1 {
            result.append(fullString.count - total)
            break
        }
        
        count += 1
        
        if l == last {
            result.append(count)
            total += count
            count = 0
        }
        
    }
    
    
    return result
    
}


//extension String {
//    subscript(index: Int) -> String {
//        get {
//            return String(self[self.index(startIndex, offsetBy: index)])
//        }
//        set {
//            let startIndex = self.index(self.startIndex, offsetBy: index)
//            self = self.replacingCharacters(in: startIndex..<self.index(after: startIndex), with: newValue)
//        }
//    }
//    
//    subscript(start: Int, end: Int) -> String {
//        get {
//            let startIndex = self.index(self.startIndex, offsetBy: start)
//            let endIndex = self.index(self.startIndex, offsetBy: end)
//            return String(self[startIndex..<endIndex])
//        }
//        set {
//            let startIndex = self.index(self.startIndex, offsetBy: start)
//            let endIndex = self.index(self.startIndex, offsetBy: end)
//            self = self.replacingCharacters(in: startIndex..<endIndex, with: newValue)
//        }
//    }
//}
//
//
