//
//  DetailView.swift
//  Facts App
//
//  Created by Abdallah Mahameed on 02/01/2024.
//

import SwiftUI

struct DetailView: View {
    @State var sectionTitle = ""
    @State var sectionBody = ""
    
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
                        Text("**The number of days after September 11th, that the Madrid Attack took place**")
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                    }
                    Section("Fact Category") {
                        Text("**1999**")
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                    }
                    Section("Number") {
                        Text("Trivia")
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
    DetailView()
}
