//
//  GameResult.swift
//  MovieQuiz
//
//

import Foundation

struct GameResult {
    let correct: Int
    let total: Int
    let date: Date
    
    func isBetterThan(_ another: GameResult) -> Bool {
            correct > another.correct
        }
    var accuracy: Double {
        guard total > 0 else { return 0.0 }
        return Double(correct) / Double(total)
    }
}
