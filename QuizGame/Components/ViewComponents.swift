//
//  ViewComponents.swift
//  QuizGame
//
//  Created by Darya Zhitova on 03.07.2022.
//

import SwiftUI

struct MainButton: View {
    var width: CoreGraphics.CGFloat
    var title: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color.accentColor)
                .frame(width: width, height: 42)
            Text(title)
                .foregroundColor(Color.white)
                .font(.system(size: 19.0, weight: .semibold, design: .rounded))
        }
    }
}

struct ProgressBar: View {
    var progress: CGFloat
    var body: some View {
        ZStack(alignment: .leading) {
            
            RoundedRectangle(cornerRadius: 10)
                .frame(maxWidth: .infinity, maxHeight: 8)
                .foregroundColor(Color.accentColor)
                .opacity(0.3)
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: progress, height: 8)
                .foregroundColor(Color.accentColor)
        }
    }
}

struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(progress: 100)
    }
}
