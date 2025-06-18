//
//  QuestionFactoryProtocol.swift
//  MovieQuiz
//
//

import Foundation

protocol QuestionFactoryProtocol {
    func requestNextQuestion()
    func setup(delegate: QuestionFactoryDelegate)
    func loadData() 
}
