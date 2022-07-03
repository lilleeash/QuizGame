//
//  MainView.swift
//  QuizGame
//
//  Created by Darya Zhitova on 03.07.2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Text("Quiz Game")
                        .font(.system(size: 42.0, weight: .bold, design: .rounded))
                        .foregroundColor(Color.accentColor)
                        .padding(.top, 75)
                    
                    Text("Computers edition")
                        .font(.system(size: 19))
                        .foregroundColor(Color.accentColor)
                        .opacity(0.5)
                    
                    Spacer()
                    
                    NavigationLink {
                        QuestionView()
                    } label: {
                        MainButton(width: 150, title: "START")
                            .padding(.bottom, 100)
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
