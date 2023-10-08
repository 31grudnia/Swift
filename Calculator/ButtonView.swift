//
//  ButtonView.swift
//  Calculator
//
//  Created by Mikołaj Starczewski on 03/10/2023.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .frame(width: 100, height: 60)
                .background(Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 2)
                )
        }
    }
}


    
#Preview {
    ButtonView(title: "Test", action: {})
}
