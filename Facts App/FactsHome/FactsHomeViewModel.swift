//
//  FactsHomeViewModel.swift
//  Facts App
//
//  Created by Abdallah Mahameed on 30/12/2023.
//

import Foundation

final class FactsHomeViewModel: ObservableObject {
    
    @Published var selectedFact: Facts = .DateFact
    @Published var firstInput = ""
    @Published var secondInput = ""
}
