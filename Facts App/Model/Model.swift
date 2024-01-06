//
//  Model.swift
//  Facts App
//
//  Created by Abdallah Mahameed on 30/12/2023.
//

struct Fact: Codable { 
    var text: String = ""
    var number: Int = 0
    var found: Bool = true
    var type: String = ""
}

enum Facts: String, Equatable, CaseIterable, Identifiable {
    var id: Self {self}
    
    case YearFact = "Year Fact"
    case TriviaFact = "Trivia Fact"
    case RandomFact = "Random Fact"
    case MathFact = "Math Fact"
    case DateFact = "Date Fact"
}
