//
//  AnswerRow.swift
//  QuizGame
//
//  Created by Darya Zhitova on 03.07.2022.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var triviaManager: TriviaManager
    @State private var isSelected: Bool = false
    var answer: AnswerModel
    
    
    var body: some View {
        HStack {
            Text(answer.title)
            Spacer()
            
            if isSelected {
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "multiply.circle.fill")
                    .foregroundColor(answer.isCorrect ? .green : .red)
            }
        }
        .padding()
        .foregroundColor(triviaManager.answerSelected ? (isSelected ? Color.accentColor : .gray) : Color.accentColor)
        .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
        .background(Color.white)
        .cornerRadius(50)
        .shadow(color: Color.accentColor, radius: 1, x: 0.5, y: 0.5)
        .onTapGesture {
            if !triviaManager.answerSelected {
                isSelected = true
                triviaManager.selectAnswer(answer: answer)
            }
        }
    }
}


struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: AnswerModel(title: "Single", isCorrect: false))
            .environmentObject(TriviaManager())
    }
}
