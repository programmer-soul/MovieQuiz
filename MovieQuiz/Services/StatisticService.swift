//
//  StatisticService.swift
//  MovieQuiz
//
//

import Foundation

class StatisticService: StatisticServiceProtocol {
    private enum Keys: String {
        case correct
        case bestGame
        case gamesCount
    }
    private let storage: UserDefaults = .standard
    private var correctAnswers: Int {
            get {
                return storage.integer(forKey: "correctAnswers")
            }
            set {
                storage.set(newValue, forKey: "correctAnswers")
            }
        }
    
    var gamesCount: Int {
        get {
            return storage.integer(forKey: Keys.gamesCount.rawValue)
            }
            set {
                storage.set(newValue, forKey: Keys.gamesCount.rawValue)
            }
    }
    
    var bestGame: GameResult {
        get {
            let correct = storage.integer(forKey: Keys.correct.rawValue)
            let total = storage.integer(forKey: "total")
            let date = storage.object(forKey: "date") as? Date ?? Date()
            return GameResult(correct: correct, total: total, date: date)
            }
            set {
                storage.set(newValue.correct, forKey: Keys.correct.rawValue)
                storage.set(newValue.total, forKey: "total")
                storage.set(newValue.date, forKey: "date")
            }
    }
    var totalAccuracy: Double {
        let totalQuestions = gamesCount * 10
        guard totalQuestions > 0 else { return 0.0 }
        return Double(correctAnswers) / Double(totalQuestions)
    }
    
    func store(correct count: Int, total amount: Int) {
        gamesCount += 1
        correctAnswers += count
        let newGame = GameResult(correct: count, total: amount, date: Date())
        if newGame.accuracy > bestGame.accuracy {
            bestGame = newGame
        }
    }
    
  
}
