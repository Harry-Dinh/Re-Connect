//
//  ContentView.swift
//  Dice Roller
//
//  Created by Harry Dinh on 2023-05-22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ContentVM.viewModel
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 50) {
                Group {
                    DRNumberView(number: $viewModel.dice1)
                    DRNumberView(number: $viewModel.dice2)
                }
                .padding()
            }
            
            HStack(spacing: 20) {
                Button(action: {
                    viewModel.dice1 = 0
                    viewModel.dice2 = 0
                }) {
                    Text("Reset")
                        .frame(width: 70)
                }
                
                Button(action: {
                    viewModel.dice1 = viewModel.rollDice()
                    viewModel.dice2 = viewModel.rollDice()
                }) {
                    Text("Roll")
                        .frame(width: 70)
                }
                .keyboardShortcut(.defaultAction)
            }
        }
        .padding()
        .frame(width: 250, height: 170)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
