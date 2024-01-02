//
//  YearFactView.swift
//  Facts App
//
//  Created by Abdallah Mahameed on 31/12/2023.
//

import SwiftUI

struct RusableFactsView: View {
    @ObservedObject var vm: FactsHomeViewModel
    @State private var input = ""
    @State private var secInput = ""
    
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
                RandomFactView()
            case .DateFact:
                CustomTextField(
                    vm: vm,
                    input: $input,
                    placeHolder: " Day")
                
                CustomTextField(
                    vm: vm,
                    input: $input,
                    placeHolder: " Month",
                    isMonthTF: true)
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
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(.blue)
                .shadow(color: .black.opacity(0.35), radius: 10)
        )
    }
}

struct CustomTextField: View {
    @ObservedObject var vm: FactsHomeViewModel
    
    @State private var isClear = false
    @State private var isSecClear = false
    @Binding var input: String
    @State var secInput: String = ""
    
    var placeHolder: String = "6 - Digits Numbers"
    var isMonthTF: Bool = false
    
    var body: some View {
        HStack{
            if isMonthTF {
                TextField(placeHolder, text: $secInput, onCommit: {
                    vm.secondInput = secInput
                    isSecClear = false
                })
                .onChange(of: secInput) { _, newValue in
                    secInput = newValue.filter { $0.isNumber }
                    if secInput.isEmpty { isSecClear = false } else { isSecClear = true }
                }
                
                if isSecClear {
                    Image(systemName: "x.circle.fill")
                        .onTapGesture{
                            secInput.removeAll()
                            Log.viewCycle.info("Button Pressed")
                        }
                        .foregroundStyle(Color.label)
                }
            }else{
                TextField(placeHolder, text: $input, onCommit: {
                    vm.firstInput = input
                    isClear = false
                })
                .onChange(of: input) { _, newValue in
                    input = newValue.filter { $0.isNumber }
                    if input.isEmpty { isClear = false } else { isClear = true }
                }
                
                if isClear {
                    Image(systemName: "x.circle.fill")
                        .onTapGesture{
                            input.removeAll()
                            Log.viewCycle.info("Button Pressed")
                        }
                        .foregroundStyle(Color.label)
                }
            }
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(.blue)
                .shadow(color: .black.opacity(0.35), radius: 10))
    }
}

struct RandomFactView: View{
    let vm = FactsHomeViewModel()
    @State private var input = ""
    
    var body: some View {
        PickerMenu(vm: vm, pickerTitle: "select a Fact")
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(.blue)
                    .shadow(color: .black.opacity(0.35), radius: 10)
            )
    }
}

#Preview {
    RusableFactsView(vm: FactsHomeViewModel())
}
