//
//  DetailView.swift
//  Facts App
//
//  Created by Abdallah Mahameed on 02/01/2024.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var vm: FactsHomeViewModel
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(
                    colors: [.blue,.orange],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
                .ignoresSafeArea()
                
                List{
                    Section("Jaw Dropping Fact") {
                        Text("**\(vm.factObject.text)**")
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                    }
                    Section("Fact Category") {
                        Text("**\(vm.factObject.type.capitalized)**")
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                    }
                    Section("Number") {
                        Text("\(vm.factObject.number)")
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Facts")
        }
    }
}

#Preview {
    DetailView(vm: FactsHomeViewModel())
}
