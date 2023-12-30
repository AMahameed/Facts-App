//
//  Model.swift
//  Facts App
//
//  Created by Abdallah Mahameed on 30/12/2023.
//

struct YearFact: Codable {
    var text: String = ""
    var number: String = ""
    var found: String = ""
    var type: String = ""
}

struct TriviaFact: Codable {
    var text: String = ""
    var number: String = ""
    var found: String = ""
    var type: String = ""
}

struct RandomFact: Codable {
    var text: String = ""
    var number: String = ""
    var found: String = ""
    var type: String = ""
}

struct MathFact: Codable {
    var text: String = ""
    var number: String = ""
    var found: String = ""
    var type: String = ""
}

struct DateFact: Codable {
    var text: String = ""
    var year: String = ""
    var number: String = ""
    var found: String = ""
    var type: String = ""
}
