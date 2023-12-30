//
//  ContentView.swift
//  Facts App
//
//  Created by Abdallah Mahameed on 30/12/2023.
//

import SwiftUI

struct FactsHomeView: View {
    @StateObject var vm = FactsHomeViewModel()
    @State private var isBounce = false
    
    
    var body: some View {
        NavigationStack{
            VStack {
                PickerMenu(vm: vm)
                SelectedFactViews(vm: vm)
            
            }
            .navigationTitle("Facts Finder")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                Button(action: {
                    Log.viewCycle.info("Info button pressed")
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
            .onChange(of: vm.selectedFact) { _, newValue in
                Log.viewCycle.info("Selected the \(newValue.rawValue)")
            }
            
        }
        .listStyle(.plain)
        
    }
}

struct SelectedFactViews: View {
    @ObservedObject var vm: FactsHomeViewModel
    
    var body: some View{
        switch vm.selectedFact {
        case .YearFact:
            Text("")
        case .TriviaFact:
            Text("")
        case .RandomFact:
            Text("")
        case .MathFact:
            Text("")
        case .DateFact:
            Text("")
        }
    }
}

#Preview {
    FactsHomeView()
}
