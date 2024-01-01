//
//  YearFactView.swift
//  Facts App
//
//  Created by Abdallah Mahameed on 31/12/2023.
//

import SwiftUI

struct RusableFactsView: View {
    @ObservedObject var vm: FactsHomeViewModel
    @State var firstInput = ""
    
    let subtitleStr = try! AttributedString(
        markdown: "Let's Find a Fact, **Ready**?")
    
    let subTextfieldStr = try! AttributedString(
        markdown: "Curious about a certain year fact? Look it up.")
    
    var body: some View{
        VStack(alignment: .leading){
            
            Text(subtitleStr)
                .font(.title2)
                .padding(.bottom, 25)
            
            VStack(alignment:.leading){
                
                TextField(" Year (Numbers only)", text: $firstInput)
                    .padding(10)
                    .onChange(of: firstInput) { _, newValue in
                        firstInput = newValue.filter { $0.isNumber }
                    }
                    .onSubmit() {
                        vm.firstInput = firstInput
                    }
                    .background(Color.systemBlue)
                    .cornerRadius(8)
                    .shadow(radius: 10)
                
                
                Text(subTextfieldStr)
                    .font(.system(.footnote, design: .default, weight: .semibold))
                    .foregroundStyle(Color.secondaryLabel)
                    .padding(.top, 3)
                
                HStack(alignment: .center, content: {
                    Image(systemName: firstInput.isEmpty ? "x.circle.fill" : "checkmark.circle.fill")
                        .contentTransition(.symbolEffect(.replace))
                        .foregroundStyle(firstInput.isEmpty ? .red : .green)
                    
                    Text("Numbers only")
                        .font(.system(.footnote, design: .default, weight: .semibold))
                        .foregroundStyle(Color.secondaryLabel)
                })
                .padding(.top, 3)
            }
        }
        .padding()
        .background(LinearGradient(
            gradient:Gradient(colors: [.systemBlue,.systemBlue]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing))
        .cornerRadius(8)
        .shadow(radius: 10)
        
    }
}

#Preview {
    RusableFactsView(vm: FactsHomeViewModel())
}
