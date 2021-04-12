//
//  621TaskScheduler.swift
//  AlgorithmsDataStructures
//
//  Created by Adriano Gaiotto de Oliveira on 2021-04-10.
//

import Foundation
func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    
    if n > 0 {
        
        var read = 0
        var chars = [Character]()
        var numChar = [Int](repeating: 0, count: 91)
        var cooldown = [Int](repeating: 0, count: 91)
        var count = 0
        var next = 0
        var start = 0
        
        
        for c in tasks {
            if !chars.contains(c) {
                chars.append(c)
            }
            numChar[Int(c.asciiValue!)] += 1
        }
        
        if tasks.count == chars.count {
            return chars.count
        }
        
        order(&chars, num: numChar)
        
        print(chars)
        
        for t in tasks{
            
            while true {
                
                
                count += 1
                
                if cooldown[Int(t.asciiValue!)] == 0  && numChar[Int(t.asciiValue!)] > 0{
                    numChar[Int(t.asciiValue!)] -= 1
                    reduce(&cooldown)
                    cooldown[Int(t.asciiValue!)] = n
                    read += 1
                    
                    if next % chars.count == 0 {
                        for i in start..<chars.count {
                            if numChar[Int(chars[i].asciiValue!)] > 0 {
                                start = i
                                break
                            }
                        }
                        
                        next = start
                        
                    } 
                    
                    print(t)
                    break
                } else {
                    var needReduce = true
                    for i in next..<chars.count {
                        if cooldown[Int(chars[i].asciiValue!)] == 0  && numChar[Int(chars[i].asciiValue!)] > 0{
                            numChar[Int(chars[i].asciiValue!)] -= 1
                            reduce(&cooldown)
                            cooldown[Int(chars[i].asciiValue!)] = n
                            print(chars[i])
                            needReduce = false
                            read += 1
                            break
                        }
                    }
                    if needReduce {
                        reduce(&cooldown)
                        next = start
                        print("idle")
                        continue
                    }
                    
                }
                
                if read == tasks.count {
                    break
                }
                
                
            }
            
            if read == tasks.count {
                break
            }
            
            
        }
        
        print("count \(count)")
        return count
    }
    
    return tasks.count
    
}


func reduce(_ cooldown: inout [Int]) {
    
    for i in 0..<cooldown.count {
        if cooldown[i] > 0 {
            cooldown[i] -= 1
        }
    }
    
}

func order(_ chars: inout [Character], num: [Int]) {
    
    var max = 0
    for i in 0..<chars.count {
        max = i
        for j in i..<chars.count {
            if num[Int(chars[j].asciiValue!)] > num[Int(chars[max].asciiValue!)] {
                max = j
            }
        }
        if i != max {
            let temp = chars[i]
            chars[i] = chars[max]
            chars[max] = temp
        }
    }
    
}
