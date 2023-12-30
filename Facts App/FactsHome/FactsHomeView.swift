//
//  ContentView.swift
//  Facts App
//
//  Created by Abdallah Mahameed on 30/12/2023.
//

import SwiftUI
import OSLog

struct FactsHomeView: View {
    @StateObject var vm = FactsHomeViewModel()
    @State private var isBounce = false
    
    
    var body: some View {
        NavigationStack{
            VStack {
                PickerMenu(vm: vm)
                
                
            }
            .navigationTitle("Facts Finder")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                Button(action: {
                    Logger(subsystem: "", category: "Button").info("Button pressed")
                    isBounce.toggle()
                }, label: {
                    Image(systemName: "info.square.fill")
                        .resizable()
                        .scaledToFit()
                        .tint(.white)
                        .symbolRenderingMode(.hierarchical)
                })
                .symbolEffect(.bounce.byLayer, value: isBounce)
            }
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(Color.systemBlue, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

struct PickerMenu: View {
    @ObservedObject var vm: FactsHomeViewModel
    
    var body: some View {
        Spacer()
        List {
            Picker("Select a Fact Category", selection: $vm.selectedFact) {
                ForEach(Facts.allCases) { fact in
                    Text(fact.rawValue)
                }
            }
            .pickerStyle(.menu)
            .tint(.systemGray)
            .font(.title2)
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

#Preview {
    FactsHomeView()
}
