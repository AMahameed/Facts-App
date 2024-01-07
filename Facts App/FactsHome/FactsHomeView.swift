//
//  ContentView.swift
//  Facts App
//
//  Created by Abdallah Mahameed on 30/12/2023.
//

import SwiftUI

struct FactsHomeView: View {
    @StateObject var vm = FactsHomeViewModel()
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .center){
                List{
                    PickerMenu(vm: vm)
                    RusableFactsView(vm: vm)
                        .listRowSeparator(.hidden)
                }
                RetrieveButton(vm: vm)
                Spacer(minLength: 50.0)
            }
            .listStyle(.plain)
            .navigationTitle("Facts Finder")
            .navigationBarTitleDisplayMode(.large)
            .toolbar { AboutViewNavLink() }
            .toolbarBackground(Color.blue, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
        .tint(.label)
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
        .onChange(of: vm.selectedFact) { _, fact in
            Log.viewCycle.info("Selected \(fact.rawValue)")
        }
        .padding(4)
    }
}

struct RetrieveButton: View {
    @ObservedObject var vm: FactsHomeViewModel
    
    var isDisabled: Bool{
        if vm.selectedFact == Facts.DateFact {
            return vm.firstInput.isEmpty || vm.secondInput.isEmpty
        } else {
            return vm.firstInput.isEmpty
        }
    }
    
    var body: some View {
            NavigationLink(destination: DetailView(vm: vm), label: {
                Text("Retrieve")
                    .font(.system(size: 20))
                    .foregroundStyle(Color.label)
                    .frame(width: PadCheck().isPad() ? 450 : 340, height: 40)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(isDisabled ? .gray : .orange)
                            .shadow(color: .black.opacity(0.35), radius: 10)
                    )
            })
            .disabled(isDisabled ? true : false)
    }
}

struct AboutViewNavLink: View {
    var body: some View {
        
        NavigationLink {
            AboutView()
        } label: {
            Image(systemName: "info.square.fill")
                .tint(.white)
                .symbolRenderingMode(.hierarchical)
        }
    }
}
