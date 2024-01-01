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
                    SelectedFactViews(vm: vm)
                    RetrieveButton()
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Facts Finder")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                NavigationLink {
                    AboutView()
                } label: {
                    Image(systemName: "info.square.fill")
                        .tint(.white)
                        .symbolRenderingMode(.hierarchical)
                        .symbolEffect(.bounce.byLayer, value: isBounce)
                        .onTapGesture(count: 2){
                            Log.viewCycle.info("Button pressed")
                            isBounce.toggle()
                        }
                }
            }
            .toolbarBackground(Color.blue, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
        .tint(.label)
    }
}

struct SelectedFactViews: View { // To DO: remove if not needed
    @ObservedObject var vm: FactsHomeViewModel
    
    var body: some View{
        switch vm.selectedFact {
        case .YearFact:
            RusableFactsView(vm: vm)
        case .TriviaFact:
            RusableFactsView(vm: vm)
        case .RandomFact:
            RusableFactsView(vm: vm)
        case .MathFact:
            RusableFactsView(vm: vm)
        case .DateFact:
            RusableFactsView(vm: vm)
        }
    }
}

struct PickerMenu: View {
    @ObservedObject var vm: FactsHomeViewModel
    @State var pickerTitle = "Fact Categories"
    
    var body: some View {
        Picker(pickerTitle, selection: $vm.selectedFact) {
            ForEach(Facts.allCases) { fact in
                Text(fact.rawValue)
            }
        }
        .pickerStyle(.menu)
        .tint(.label)
        .font(.title2)
        .onChange(of: vm.selectedFact) { _, newValue in
            Log.viewCycle.info("Selected \(newValue.rawValue)")
        }
        .padding(4)
    }
}

struct RetrieveButton: View {
    var body: some View {
        
        Button(action: {
            Log.viewCycle.info("Button pressed") // To Do
        }, label: {
            Text("Retrieve")
                .font(.system(size: 20))
                .frame(width: 310)
        })
        .buttonStyle(.borderedProminent)
        .tint(.orange)
        .foregroundStyle(Color.label)
        .padding(.top, 80)
    }
}

#Preview{
    FactsHomeView()
}
