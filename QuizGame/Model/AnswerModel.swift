//
//  AnswerModel.swift
//  QuizGame
//
//  Created by Darya Zhitova on 03.07.2022.
//

import Foundation

struct AnswerModel: Identifiable {
    var id = UUID()
    var title: AttributedString
    var isCorrect: Bool
}
