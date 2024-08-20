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
            
            LinearGradient(colors: [Color(.lightBlue), Color(.mediumBlue)],
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack (spacing: 10) {
                Image("dentist-study")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .padding(.bottom, 10)
                    .shadow(radius: 5, y:5)
                Text("Quiz yourself!")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.mainText)
                Text("Swipe right on a flashcard to add it to your Saved Deck")
                    .font(.headline)
                    .foregroundStyle(Color.mainText)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 25)
                
                NavigationLink(destination: ContentView()) {
                    Text("Got it!")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                    
                }
                .navigationBarTitle("")
                                .navigationBarHidden(true)
            }
        }
    }
}

#Preview {
    OnboardingThirdView()
}
