//
//  QuestionView.swift
//  QuizGame
//
//  Created by Darya Zhitova on 03.07.2022.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    var body: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                
                Text("\(triviaManager.index + 1)/\(triviaManager.lenght) Question")
                    .font(.system(size: 34.0, weight: .bold, design: .rounded))
                    .foregroundColor(Color.accentColor)
                
                ProgressBar(progress: triviaManager.progress)
                
                Text(triviaManager.question)
                    .font(.system(size: 17.0, weight: .regular))
                    .foregroundColor(Color.accentColor)
                    .opacity(0.75)
                
                Spacer()
                
                ForEach(triviaManager.answerChoice, id: \.id) { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(triviaManager)
                }
                
                Spacer()
                
                Button {
                    triviaManager.nextQuestion()
                } label: {
                    MainButton(width: 150, title: "next")
                }
                .disabled(!triviaManager.answerSelected)
                
            }
            .padding()
            .navigationBarHidden(true)
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
