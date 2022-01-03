//
//  CalculatorManager.swift
//  Calculator
//
//  Created by Ufuk Canlı on 2.01.2022.
//

import Foundation

final class CalculatorManager {
    
    private(set) var working = ""
    private(set) var result = ""
    
    var errorHappened = false
    
    private func clearAll() {
        working = ""
        result = ""
    }
    
    private func clearLast() {
        guard !working.isEmpty else { return }
        working.removeLast()
    }
    
    private func addToWorking(value: String) {
        working += value
    }
    
    private func calculate() {
        guard !working.isEmpty else { return }
        let expression = NSExpression(format: working)
        let resultDouble = expression.expressionValue(with: nil, context: nil) as! Double
        let resultString = format(result: resultDouble)
        result = resultString
    }
    
    private func format(result: Double) -> String {
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", result)
        } else {
            return String(format: "%.2f", result)
        }
    }
    
    private func isValidInput() -> Bool {
        var count = 0
        var charIndexes = [Int]()
        
        for char in working {
            if isOperand(char) {
                charIndexes.append(count)
            }
            count += 1
        }
        
        var previous = -1
        
        for index in charIndexes {
            if index == 0 || index == working.count - 1 {
                return false
            }
            
            if previous != -1 {
                if index - previous == 1 {
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    private func isOperand(_ char: Character) -> Bool {
        if char == "*" || char == "/" || char == "+" || char == "-" {
            return true
        }
        return false
    }
    
    func makeAction(_ value: String, tag: Int) {
        switch tag {
        case 11:
            clearAll()
        case 12:
            clearLast()
        case 15:
            if isValidInput() {
                calculate()
            } else {
                errorHappened = true
            }
        default:
            addToWorking(value: value)
        }
    }
}
