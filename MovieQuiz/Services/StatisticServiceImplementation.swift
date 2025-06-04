//
//  StatisticServiceImplementation.swift
//  MovieQuiz
//
//

import Foundation

final class StatisticServiceImplementation: StatisticService {
    var correctAnswersPublic: Int {
        get {
            return UserDefaults.standard.integer(forKey: "correctAnswers")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "correctAnswers")
        }
    }
}
