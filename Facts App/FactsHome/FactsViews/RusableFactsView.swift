//
//  YearFactView.swift
//  Facts App
//
//  Created by Abdallah Mahameed on 31/12/2023.
//

import SwiftUI

struct RusableFactsView: View {
    @ObservedObject var vm: FactsHomeViewModel
    @State var input = ""
    
    let subtitleStr = try! AttributedString(
        markdown: "Let's Find a Fact, **Ready**?")
    
    var body: some View{
        VStack(alignment: .leading){
            
            Text(subtitleStr)
                .font(.title2)
                .padding(.bottom, 25)
            
            switch vm.selectedFact{
            case .YearFact:
                CustomTextField(
                    vm: vm,
                    input: $input,
                    placeHolder: "Year")
            case .RandomFact:
                RandomFactView(vm: vm)
            case .DateFact:
                CustomTextField(
                    vm: vm,
                    input: $input,
                    placeHolder: " Day")
                
                CustomTextField(
                    vm: vm,
                    input: $input,
                    placeHolder: " Month",
                    isDateView: true)
            default:
                CustomTextField(vm: vm, input: $input)
            }
            
            
            Text("Curious about a certain fact? Look it up.")
                .font(.system(.footnote, design: .default, weight: .semibold))
                .foregroundStyle(Color.secondaryLabel)
                .padding(.top, 3)
            
            HStack{
                Image(systemName:
                        input.isEmpty ? "x.circle.fill" : "checkmark.circle.fill"
                )
                .contentTransition(.symbolEffect(.replace))
                .foregroundStyle(
                    input.isEmpty ? .red : .green
                )
                
                Text("Numbers only")
                    .font(.system(.footnote, design: .default, weight: .semibold))
                    .foregroundStyle(Color.secondaryLabel)
            }
            .padding(.top, 3)
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

struct CustomTextField: View {
    @ObservedObject var vm: FactsHomeViewModel
    @Binding var input: String
    var placeHolder: String = "6 - Digits Numbers"
    var isDateView: Bool = false
    
    var body: some View {
        TextField(placeHolder, text: $input)
            .padding(10)
            .onChange(of: input) { _, newValue in
                input = newValue.filter { $0.isNumber }
            }
            .onSubmit() {
                vm.firstInput = input
                if isDateView { vm.secondInput = input }
            }
            .background(Color.systemBlue)
            .cornerRadius(8)
            .shadow(radius: 10)
    }
}

struct RandomFactView: View{
    @ObservedObject var vm: FactsHomeViewModel
    @State var input = ""
    var body: some View {
        PickerMenu(vm: vm, pickerTitle: "Select a Fact")
            .background(Color.systemBlue)
            .cornerRadius(8)
            .shadow(radius: 10)
    }
}
