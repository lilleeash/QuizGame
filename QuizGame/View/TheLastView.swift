//
//  TheLastView.swift
//  QuizGame
//
//  Created by Darya Zhitova on 04.07.2022.
//

import SwiftUI

struct TheLastView: View {
    @StateObject var triviaManager = TriviaManager()
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Text("Good job!")
                        .font(.system(size: 42.0, weight: .bold, design: .rounded))
                        .foregroundColor(Color.accentColor)
                        .padding(.top, 75)
                    
                    Text("\(triviaManager.score)/10 answers are correct")
                        .font(.system(size: 19))
                        .foregroundColor(Color.accentColor)
                        .opacity(0.5)
                    
                    Spacer()
                    
                    Button {
                        Task.init {
                            await triviaManager.fetchUrl()
                        }
                    } label: {
                        MainButton(width: 150, title: "MAIN VIEW")
                    }

                    
                    Spacer()
                }
                .navigationBarHidden(true)
            }
        }
    }
}

struct TheLastView_Previews: PreviewProvider {
    static var previews: some View {
        TheLastView()
    }
}
