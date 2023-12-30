//
//  Model.swift
//  Facts App
//
//  Created by Abdallah Mahameed on 30/12/2023.
//

struct YearFact: Codable { // Year
    var text: String = ""
    var number: String = ""
    var found: String = ""
    var type: String = ""
}

struct TriviaFact: Codable { // Number
    var text: String = ""
    var number: String = ""
    var found: String = ""
    var type: String = ""
}

struct RandomFact: Codable { // Type
    var text: String = ""
    var number: String = ""
    var found: String = ""
    var type: String = ""
}

struct MathFact: Codable { // Number
    var text: String = ""
    var number: String = ""
    var found: String = ""
    var type: String = ""
}

struct DateFact: Codable { // Day & Month
    var text: String = ""
    var year: String = ""
    var number: String = ""
    var found: String = ""
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
