//
//  YearFactView.swift
//  Facts App
//
//  Created by Abdallah Mahameed on 31/12/2023.
//

import SwiftUI

struct RusableFactsView: View {
    @ObservedObject var vm: FactsHomeViewModel
    
    let subtitleStr = try! AttributedString(
        markdown: "Let's Find a Fact, **Ready**?")
    
    var isDisabled: Bool{
        if vm.selectedFact == Facts.DateFact {
            return vm.firstInput.isEmpty || vm.secondInput.isEmpty
        } else {
            return vm.firstInput.isEmpty
        }
    }
    
    var body: some View{
        VStack(alignment: .leading){
            
            Text(subtitleStr)
                .font(.title2)
                .padding(.bottom, 25)
            
            switch vm.selectedFact{
            case .YearFact:
                CustomTextField(
                    vm: vm,
                    placeHolder: "Year")
            case .RandomFact:
                RandomFactView(vm: vm)
            case .DateFact:
                CustomTextField(
                    vm: vm,
                    placeHolder: " Day")
                
                CustomTextField(
                    vm: vm,
                    placeHolder: " Month",
                    isMonthTF: true)
            default:
                CustomTextField(vm: vm)
            }
            
            Text("Curious about a certain fact? Look it up.")
                .font(.system(.footnote, design: .default, weight: .semibold))
                .foregroundStyle(Color.secondaryLabel)
                .padding(.top, 3)
            
            if vm.selectedFact == Facts.RandomFact {
                EmptyView()
            } else {
                HStack{
                    Image(systemName:
                            isDisabled ? "x.circle.fill" : "checkmark.circle.fill"
                    )
                    .contentTransition(.symbolEffect(.replace))
                    .foregroundStyle(
                        isDisabled ? .red : .green
                    )
                    
                    Text("Numbers only")
                        .font(.system(.footnote, design: .default, weight: .semibold))
                        .foregroundStyle(Color.secondaryLabel)
                }
                .padding(.top, 3)
            }
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
    
    var placeHolder: String = "6 - Digits Numbers"
    var isMonthTF: Bool = false
    
    var body: some View {
        HStack{
            if isMonthTF {
                TextField(placeHolder, text: $vm.secondInput, onCommit: {
                    isSecClear = false
                })
                .onChange(of: vm.secondInput) { _, newValue in
                    vm.secondInput = newValue.filter { $0.isNumber }
                    if vm.secondInput.isEmpty { isSecClear = false } else { isSecClear = true }
                }
                .onTapGesture {
                    if vm.secondInput.isEmpty { isSecClear = false } else { isSecClear = true }
                }
                
                if isSecClear {
                    Image(systemName: "x.circle.fill")
                        .onTapGesture{
                            vm.secondInput.removeAll()
                            Log.viewCycle.info("Button Pressed")
                        }
                        .foregroundStyle(Color.label)
                }
            }else{
                TextField(placeHolder, text: $vm.firstInput, onCommit: {
                    isClear = false
                })
                .onChange(of: vm.firstInput) { _, newValue in
                    vm.firstInput = newValue.filter { $0.isNumber }
                    if vm.firstInput.isEmpty { isClear = false } else { isClear = true }
                }
                .onTapGesture {
                    if vm.firstInput.isEmpty { isClear = false } else { isClear = true }
                }
                
                if isClear {
                    Image(systemName: "x.circle.fill")
                        .onTapGesture{
                            vm.firstInput.removeAll()
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
    @ObservedObject var vm: FactsHomeViewModel
    
    var body: some View {
        Picker("Select Fact", selection: $vm.selectedFact2) {
            ForEach([Facts.DateFact, Facts.MathFact, Facts.TriviaFact, Facts.YearFact]) { fact in
                Text(fact.rawValue)
            }
        }
        .pickerStyle(.menu)
        .tint(.label)
        .font(.title3)
        .onChange(of: vm.selectedFact2) { _, fact in
            Log.viewCycle.info("Selected \(fact.rawValue)")
            vm.pickerInput = vm.AdjustFactString(for: fact)
        }
        .padding(7)
    }
}
