//
//  FactsHomeViewModel.swift
//  Facts App
//
//  Created by Abdallah Mahameed on 30/12/2023.
//

import Foundation
import Combine

final class FactsHomeViewModel: ObservableObject {
    
    @Published var selectedFact: Facts = .DateFact
    @Published var firstInput = ""
    @Published var secondInput = ""
    private var cancellable = Set<AnyCancellable>()
    @Published var factObject = Fact()
    
    private var networkService: Network
    
    init(networkService: Network = Network()) {
        self.networkService = networkService
    }
    
    func getData() {
        var customURL = ""
        
        switch selectedFact {
        case .YearFact:
            customURL = firstInput + "/year?fragment=true&json=true"
        case .TriviaFact:
            customURL = firstInput + "/trivia?fragment=true&notfound=floor&json=true"
        case .RandomFact:
            customURL = "/random/\(firstInput)?min=10&max=20&fragment=true&json=true"
        case .MathFact:
            customURL = firstInput + "/math?fragment=true&json=true"
        case .DateFact:
            customURL = "\(secondInput)/\(firstInput)/date?fragment=true&json=true"
        }
        
        networkService.fetchData(for: Fact.self, url: customURL)
            .sink { complition in
                switch complition{
                case .failure(let error):
                    Log.error.error("\(error)")
                case .finished:
                    Log.data.info("Data Fetched")
                }
            } receiveValue: { factObject in
                self.factObject = factObject
            }.store(in: &cancellable)
    }
}
