//
//  621TaskScheduler.swift
//  AlgorithmsDataStructures
//
//  Created by Adriano Gaiotto de Oliveira on 2021-04-10.
//

import Foundation
func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    
    if n > 0 {
        
        var result = 0
        var diff = 0
        var chars = [Character]()
        var numChar = [Int](repeating: 0, count: 91)
        
        for c in tasks {
            if !chars.contains(c) {
                chars.append(c)
            }
            numChar[Int(c.asciiValue!)] += 1
        }
        
        for i in 1..<chars.count {
            diff += (Int(chars[i].asciiValue!) - Int(chars[i-1].asciiValue!))
        }
        
        if tasks.count != chars.count {
            result = tasks.count + ((n - diff) * chars.count)
        } else {
            result = tasks.count
        }
        
        return result < 0 ? result * -1 : result
    } else {
        return tasks.count
    }
    
}
//    var check = [Bool](repeating: false, count: tasks.count)
//    var task = [Character]()
//    var chars = [Character]()
//    var count = 0
//
//    for c in tasks.reversed() {
//        if !chars.contains(c) {
//            chars.append(c)
//        }
//        task.append(c)
//    }
//
//    var cooldown = [Int](repeating: 0, count: Int(chars[0].asciiValue!) + 1)
//
//    while check.contains(false) {
//        var next = task.count - 1
//        while !task.isEmpty {
//            if !check[next] && cooldown[Int(task[next].asciiValue!)] == 0 {
//                print(task[next])
//                count += 1
//                check[next] = true
//                reduce(&cooldown)
//                cooldown[Int(task[next].asciiValue!)] = n
//                task.remove(at: next)
//                check.remove(at: next)
//            }
//            next = (next / 2) - 1
//            if next < 0 && !needReduce(cooldown, task){
//                next = task.count - 1
//            } else if next < 0 {
//                break
//            }
//        }
//        if needReduce(cooldown, task) && check.contains(false) {
//        reduce(&cooldown)
//        count += 1
//            next = task.count - 1
//        }
//    }
//
//
//
//    return count
//}


func reduce(_ cooldown: inout [Int]) {
    
    for i in 0..<cooldown.count {
        if cooldown[i] > 0 {
            cooldown[i] -= 1
        }
    }
    
}

func needReduce(_ cooldown: [Int], _ chars : [Character]) -> Bool{
    
    for i in chars {
        if cooldown[Int(i.asciiValue!)] == 0 {
            return false
        }
    }
    return true
}
