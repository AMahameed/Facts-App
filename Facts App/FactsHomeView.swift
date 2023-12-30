//
//  ContentView.swift
//  Facts App
//
//  Created by Abdallah Mahameed on 30/12/2023.
//

import SwiftUI
import OSLog

struct FactsHomeView: View {
    var body: some View {
        VStack {
            
        }
        .navigationTitle("Hello, Dear User")
        
        .toolbarBackground(Color.blue, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbar {
            Button(action: {
                Logger(subsystem: "", category: "Button").info("Button pressed")
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
        }
        
    }
}

#Preview {
    FactsHomeView()
}
