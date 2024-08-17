//
//  OnboardingThirdView.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/17/24.
//

import SwiftUI

struct OnboardingThirdView: View {
    var body: some View {
        ZStack {
            
            LinearGradient(colors: [Color(.lightGreen), Color(.darkGreen)],
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack (spacing: 10) {
                Image(systemName: "person.fill.questionmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.bottom, 10)
                Text("Quiz yourself!")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.mainText)
                Text("Swipe right on a flashcard to add it to your Saved Deck")
                    .font(.headline)
                    .foregroundStyle(Color.mainText)
                    .multilineTextAlignment(.center)
            }
            
        }
    }
}

#Preview {
    OnboardingThirdView()
}
