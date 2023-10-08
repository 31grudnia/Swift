//
//  ButtonFunctions.swift
//  Calculator
//
//  Created by Mikołaj Starczewski on 05/10/2023.
//

import Foundation


let numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
let operators = [ "+", "-", "*", "/", "sin()"]


func buttonTapHandler(_ buttonTitle: String, _ firstNumber: inout String, _ secondNumber: inout String, _ currentOperator: inout String, _ isFirstNumber: inout Bool, _ errorMessage: inout String) -> Void {
    /*
     
     @TODO
     SIN() handler
     
     */
    
    if numbers.contains(buttonTitle) {
        isFirstNumber ? (firstNumber += buttonTitle) : (secondNumber += buttonTitle)
        
    }   else if operators.contains(buttonTitle) {
        if firstNumber == "" {
            errorMessage = "Choose first number!"
            
        }   else if currentOperator == "sin()" {
            
            if isFirstNumber {
                errorMessage = "Choose only ONE number!"
            }
            currentOperator = "sin()"
            secondNumber = ""
            isFirstNumber = true
            
        }   else {
            currentOperator = buttonTitle
            isFirstNumber.toggle()
        }
    }
    
}
