//
//  ContentView.swift
//  Calculator
//
//  Created by Mikołaj Starczewski on 03/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var firstNumber = ""
    @State private var secondNumber = ""
    @State private var isFirstNumber: Bool = true
    @State private var currentOperator: String = ""
    @State private var errorMessage: String = ""
    @State private var mainText: String = ""

    let buttonRows = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        ["0", "+", "-"],
        ["*", "/", "sin()"]
    ]
    
    var body: some View {
        VStack {
            Text("Kalkulatorek")
                .font(.title)
                .bold()
            
            ErrorView(errorMessage: $errorMessage)
            
            Text(mainText)
                .font(.title)
                .frame(width: 315, height: 60)
                .background(Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 2)
                )
            
            ForEach(buttonRows, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { buttonTitle in
                        ButtonView(title: buttonTitle) {
                            buttonTapHandler(buttonTitle, &firstNumber, &secondNumber,  &currentOperator, &isFirstNumber, &errorMessage)
                            mainText = firstNumber + currentOperator + secondNumber
                            errorMessage = ""
                            
                        }   // ButtonView()
                    }   // ForEach row
                }   // HStack
            }   // ForEach buttonRows
            
            Button("OBLICZ") {
                
//                if currentOperator == "sin()" {
//
//                }   else
                if currentOperator != "" && (secondNumber != "" || currentOperator == "sin()") {
                    mainText = Calculations().calculateResult(firstNumber, secondNumber, currentOperator, &errorMessage)
                    firstNumber = ""
                    secondNumber = ""
                    isFirstNumber = true
                    currentOperator = ""
                    
                }   else if firstNumber == "" {
                    errorMessage = "Choose first number!"
                }   else if currentOperator == "" {
                    errorMessage = "Choose an operator!"
                }   else if secondNumber == "" {
                    errorMessage = "Choose second number!"
                }
            }.font(.headline)
                .frame(width: 315, height: 60)
                .background(Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 2)
                )
        }   // VStack
    }   // var body
}   // struct ContentView

#Preview {
    ContentView()
}
