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
                RetrieveButton()
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

//struct SelectedFactViews: View { // To DO: remove if not needed
//    @ObservedObject var vm: FactsHomeViewModel
//
//    var body: some View{
//        switch vm.selectedFact {
//        case .YearFact:
//            RusableFactsView(vm: vm)
//        case .TriviaFact:
//            RusableFactsView(vm: vm)
//        case .RandomFact:
//            RusableFactsView(vm: vm)
//        case .MathFact:
//            RusableFactsView(vm: vm)
//        case .DateFact:
//            RusableFactsView(vm: vm)
//        }
//    }
//}

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
        
        NavigationLink(destination: DetailView(), label: {
            Text("Retrieve")
                .font(.system(size: 20))
                .foregroundStyle(Color.label)
                .frame(width: PadCheck().isPad() ? 450 : 340, height: 40)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.orange)
                        .shadow(color: .black.opacity(0.35), radius: 10)
                )
        })
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

#Preview{
    FactsHomeView()
}
