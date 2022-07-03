//
//  TriviaManager.swift
//  QuizGame
//
//  Created by Darya Zhitova on 03.07.2022.
//

import Foundation
import SwiftUI

class TriviaManager: ObservableObject {
    
    private(set) var trivia: [TriviaModel.Result] = []
    @Published private(set) var lenght = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoice: [AnswerModel] = []
    @Published private(set) var progress: CGFloat = 0.00
    @Published private(set) var score = 0
    
    init() {
        Task.init {
            await fetchUrl()
        }
    }
    
    func fetchUrl() async {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=10&category=18&difficulty=easy&type=multiple") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Missing data") }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(TriviaModel.self, from: data)
            
            DispatchQueue.main.async {
                self.index = 0
                self.score = 0
                self.progress = 0
                self.reachedEnd = false
                
                self.trivia = decodedData.results
                self.lenght = self.trivia.count
                self.setQuestion()
            }
            
        } catch {
            print(error)
        }
    }
    
    func nextQuestion() {
        if index + 1 < lenght {
            index += 1
            setQuestion()
        } else {
            reachedEnd = true
        }
    }
    
    func setQuestion() {
        answerSelected = false
        progress = CGFloat(Double(index + 1) / Double(lenght) * 350)
        
        if index < lenght {
            let currentTriviaQuestion = trivia[index]
            question = currentTriviaQuestion.formattedQuestion
            answerChoice = currentTriviaQuestion.answers
        }
    }
    
    func selectAnswer(answer: AnswerModel) {
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
    
}
