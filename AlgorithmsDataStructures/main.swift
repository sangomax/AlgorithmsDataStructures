//
//  main.swift
//  AlgorithmsDataStructures
//
//  Created by Adriano Gaiotto de Oliveira on 2021-03-09.
//

import Foundation


//print(power(base: 2, exponent: 3))


//var (result, length) = evaluate("((1+3)+((1+2)*5))", pos: 0)
//print(result)


//print(quickSort([2,4,6,8,4,4,654,76,87,12,3,65,1,09,9,2,5], <))

//print("\nSTACK\n")
//var s = Stack<Int>()
//
//s.push(item: 2)
//s.push(item: 4)
//print(s.pop()!)
//s.push(item: 45)
//s.push(item: 7)
//print(s.peek()!)
//s.push(item: 12)
//print(s.pop()!)
//s.push(item: 89)
//
//for i in s {
//    print(i)
//}
//print(s.description)
//
//print("\nQUEUE\n")
//
//var q = Queue<Int>()
//
//q.enqueue(item: 2)
//q.enqueue(item: 4)
//print(q.dequeue()!)
//q.enqueue(item: 45)
//q.enqueue(item: 7)
//print(q.peek()!)
//q.enqueue(item: 12)
//print(q.dequeue()!)
//q.enqueue(item: 89)
//
//for i in q {
//    print(i)
//}
//print(q.description)


//func search(_ word: String, _ text: String) {
//    var index: [Int] = []
//    for letter in 0...(text.count - word.count) {
//        if (text[letter] == word[0]) {
//            index.append(letter)
//            if (text[letter, letter + word.count] == word[0,word.count]) {
//                    print(word)
//                break
//            }
//        }
//    }
//
//}

//func findWord(_ targetWord: String, _ word: String) {
// var i = 0
// var j = 0
// var firstLettersCount = 0
// for index in 0..<word.count {
//  if (targetWord[0] != targetWord[index]) { break }
//  firstLettersCount += 1
// }
//// let firstLettersCounttemp = targetWord.filter { Character(targetWord[0]) == $0 }.count
// while (i < word.count) {
//  if j == targetWord.count { break }
//  if targetWord[j] == word[i] {
//   j += 1
//   i += 1
//  } else {
//   if j != firstLettersCount || word[i] != targetWord[0] {
//    j = 0
//   }
//   i += 1
//  }
// }
// print((j > 0) ? i - j : -1)
//}
//
//
//print(findWord("EEABC", "EEEABC"))
//print(findWord("WORD", "WWWWWWWWWWORD"))
//print(findWord("EEABC", "EEABC"))
//print(findWord("EEEABC", "EEEABC"))
//print(findWord("EEABC", "EEEABC"))
//print(findWord("EEABC", "EEEABC"))



//whoIsMyParent()
//diameter()
//LCA()
//CyclicPermutation()
//RepeatingSequence()
//
//let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//for i in 1...25 {
//
//    let fileURLIn = URL(fileURLWithPath: "/Users/adrianogaiotto/Documents/WMAD/ClassFiles/Swift/AlgorithmsDataStructures/AlgorithmsDataStructures/Assignments/GraphAssignment2/TestCases/sushi.\(i).in", relativeTo: directoryURL)
//
//    let fileURLOut = URL(fileURLWithPath: "/Users/adrianogaiotto/Documents/WMAD/ClassFiles/Swift/AlgorithmsDataStructures/AlgorithmsDataStructures/Assignments/GraphAssignment2/TestCases/sushi.\(i).out", relativeTo: directoryURL)
//
//    var input = [String.SubSequence]()
//    var result = ""
//    do {
//        // Get the saved data
//        let savedDataIn = try Data(contentsOf: fileURLIn)
//        let savedDataOut = try Data(contentsOf: fileURLOut)
//        // Convert the data back into a string
//        if let savedString = String(data: savedDataIn, encoding: .utf8) {
//            input = savedString.split(separator: "\n")
//
//        }
//        if let savedString = String(data: savedDataOut, encoding: .utf8) {
//            result = String(savedString.split(separator: "\n")[0])
//
//        }
//    } catch {
//        // Catch any errors
//        print("Unable to read the file")
//    }
//
//    let distance = SushiRestaurantReviews(input)
//
//    if Int(result)! == distance {
//        print("test \(i) - pass")
//    } else {
//        print("test \(i) - wrong")
//    }
//}
//
//

//tomateFarm()
bridges()
