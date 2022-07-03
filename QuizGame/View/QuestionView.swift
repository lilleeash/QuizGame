//
//  QuestionView.swift
//  QuizGame
//
//  Created by Darya Zhitova on 03.07.2022.
//

import SwiftUI

struct QuestionView: View {
    var body: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                
                Text("1/10 Question")
                    .font(.system(size: 34.0, weight: .bold, design: .rounded))
                    .foregroundColor(Color.accentColor)
                
                ProgressBar(progress: 30)
                
                Text("What is the most preferred image format used for logos in the Wikimedia database?")
                    .font(.system(size: 17.0, weight: .regular))
                    .foregroundColor(Color.accentColor)
                    .opacity(0.75)
                
                Spacer()
                
                AnswerRow(answer: AnswerModel(title: ".svg", isCorrect: true))
                
                AnswerRow(answer: AnswerModel(title: ".png", isCorrect: false))
                
                AnswerRow(answer: AnswerModel(title: ".jpeg", isCorrect: false))
                
                AnswerRow(answer: AnswerModel(title: ".pdf", isCorrect: false))
                
                Spacer()
            
                MainButton(width: 150, title: "next")
                
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
