//  /*
//
//  Project: Defaults
//  File: iExpense.swift
//  Created by: Elaidzha Shchukin
//  Date: 05.04.2024
//
//  */

import SwiftUI

struct iExpense: View {
    // @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        VStack {
            Button("Tap Count: \(tapCount)") {
                tapCount += 1
                // UserDefaults.standard.set(tapCount, forKey: "Tap")
            }
            .font(.headline)
            .bold()
            .foregroundStyle(Color(.label))
            .padding()
            .background(Color.brown.gradient)
            .cornerRadius(15)
        }
    }
}

#Preview {
    iExpense()
}

