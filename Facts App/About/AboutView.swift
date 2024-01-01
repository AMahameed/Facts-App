//
//  AboutView.swift
//  Facts App
//
//  Created by Abdallah Mahameed on 01/01/2024.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Why Facts App?") {
                    Text("Facts App is not just an app; it's an educational and entertaining journey through the world of numbers. Whether you're a math enthusiast, trivia lover, or someone curious about historical events, this app caters to your thirst for knowledge.")
                }
                Section("How to Use") {
                    Text("1. Simply select a category –> Trivia, Math, Date, or Year.\n\n2. Enter your preferred number or date.\n\n3. Discover captivating facts that add a new dimension to your understanding of numbers.")
                }
                Section("General") {
                    Text("App Version: \(appVersion)")
                    Text("Developer: Abdallah Mahameed")
                }
            }
            .background(.clear)
            .navigationTitle("About")
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(Color.blue, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    AboutView()
}
