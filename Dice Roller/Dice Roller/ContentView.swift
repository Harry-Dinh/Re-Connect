//
//  ContentView.swift
//  Dice Roller
//
//  Created by Harry Dinh on 2023-05-23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel = ContentVM.viewModel
    
    var body: some View {
        NavigationView {
            VStack {
                CustomEmptyView(height: 60)
                
                HStack(spacing: 50) {
                    Group {
                        DRNumberView(number: $viewModel.dice1)
                        DRNumberView(number: $viewModel.dice2)
                    }
                    .padding()
                }
                
                Spacer()
                
                HStack(spacing: 20) {
                    Button(action: {
                        viewModel.resetValues()
                    }) {
                        Text("Reset")
                            .frame(width: UIScreen.main.bounds.width / 4)
                    }
                    .buttonStyle(.bordered)
                    
                    Button(action: {
                        viewModel.dice1 = viewModel.rollDice()
                        viewModel.dice2 = viewModel.rollDice()
                    }) {
                        Text("Roll")
                            .frame(width: UIScreen.main.bounds.width / 4)
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .navigationTitle("Dice Roller")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Picker(selection: .constant(1)) {
                            Label("1 Dice", systemImage: "1.square")
                                .tag(0)
                            Label("2 Dices", systemImage: "2.square")
                                .tag(1)
                        } label: {
                            EmptyView()
                        }
                    } label: {
                        Image(systemName: "dice")
                            .frame(width: 20, height: 20)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
