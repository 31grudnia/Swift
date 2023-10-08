//
//  Calculations.swift
//  Calculator
//
//  Created by Mikołaj Starczewski on 03/10/2023.
//

import Foundation


struct Calculations {
    func calculateResult(_ val1: String, _ val2: String, _ currentOperator: String, _ errorMessage: inout String) -> String {
        
        var result: String
        
        switch currentOperator {
        case "sin()":
            result = String(format: "%.2f", sinOperation(Int(val1)!))
            return "sin(" + result + ")"
            
        case "+":
            result = String(addOperation(Int(val1)!, Int(val2)!))
            return result
            
        case "-":
            result = String(subOperation(Int(val1)!, Int(val2)!))
            return result
            
        case "*":
            result = String(multiplyOperation(Int(val1)!, Int(val2)!))
            return result
            
        case "/":
            do {
                result = try String(format: "%.2f", divOperation(Double(val1)!, Double(val2)!))
                return result
                
            }   catch DivisionError.divisionByZero {
                errorMessage = "Don't divide by 0!"
                
            }   catch {
                // some other errors
            }
        default:
            print("Switch Case default statement. Calcultion files.")
        }
        
        return "Calculations file error Switch Case ommited."
    }
    
    
    func sinOperation(_ val1: Int) -> Double {
        return sin(Double(val1))
    }
    
    func addOperation(_ val1: Int, _ val2: Int) -> Int {
        return val1 + val2
    }
    
    func subOperation(_ val1: Int, _ val2: Int) -> Int {
        return val1 - val2
    }
    
    func multiplyOperation(_ val1: Int, _ val2: Int) -> Int {
        return val1 * val2
    }
    
    func divOperation(_ val1: Double, _ val2: Double) throws -> Double {
        guard val2 != 0 else {
            throw DivisionError.divisionByZero
        }
        return Double(val1 / val2)
    }
    
}
