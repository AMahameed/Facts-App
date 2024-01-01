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
            List{
                VStack(alignment: .center){
                    PickerMenu(vm: vm)
                    RetrieveButton()
                }
                .padding(.top)
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Facts Finder")
            .navigationBarTitleDisplayMode(.large)
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
            .toolbarBackground(Color.systemBlue, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            
            
        }
    }
}

struct PickerMenu: View {
    @ObservedObject var vm: FactsHomeViewModel
    
    var body: some View {
        Picker("Fact Categories", selection: $vm.selectedFact) {
            ForEach(Facts.allCases) { fact in
                Text(fact.rawValue)
            }
        }
        .pickerStyle(.menu)
        .tint(.label)
        .font(.title2)
        .onChange(of: vm.selectedFact) { _, newValue in
            Log.viewCycle.info("Selected the \(newValue.rawValue)")
        }
        .padding(8)
        
        SelectedFactViews(vm: vm)
    }
}

struct SelectedFactViews: View {
    @ObservedObject var vm: FactsHomeViewModel
    
    var body: some View{
        switch vm.selectedFact {
        case .YearFact:
            RusableFactsView(vm: vm)
        case .TriviaFact:
            Text("2")
        case .RandomFact:
            Text("3")
        case .MathFact:
            Text("4")
        case .DateFact:
            Text("5")
        }
    }
}

#Preview{
    FactsHomeView()
}

struct RetrieveButton: View {
    var body: some View {
        GeometryReader { geometry in
            
            Button(action: {
                
            }, label: {
                Text("Retrieve")
                    .font(.system(size: 20))
                    .frame(width: min(geometry.size.width , 300), height: 30)
            })
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
