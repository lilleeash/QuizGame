//
//  TrivialModel.swift
//  QuizGame
//
//  Created by Darya Zhitova on 03.07.2022.
//

import Foundation


struct TriviaModel: Decodable {
    var results: [Result]
    
    struct Result: Decodable, Identifiable {
        var id: UUID {
            UUID()
        }
        var category: String
        var type: String
        var difficulty: String
        var question: String
        var correctAnswer: String
        var incorrectAnswers: [String]
        
        var formattedQuestion: AttributedString {
            do {
                return try AttributedString(markdown: question)
            } catch {
                print("Error setting formattedQuestion: \(error)")
                return ""
            }
        }
            
            var answers: [AnswerModel] {
                do {
                    let correct = [AnswerModel(title: try AttributedString(markdown: correctAnswer), isCorrect: true)]
                    let incorrects = try incorrectAnswers.map { answer in
                        AnswerModel(title: try AttributedString(markdown: answer), isCorrect: false)
                    }
                    let allAnswers = correct + incorrects
                    return allAnswers.shuffled()
                } catch {
                    print("Error setting answers: \(error)")
                    return []
                }
            }
        }
    }
