//
//  OnboardingSecondView.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/17/24.
//

import SwiftUI

struct OnboardingSecondView: View {
    var body: some View {
        ZStack {
            
            LinearGradient(colors: [Color(.lightGreen), Color(.darkGreen)],
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack (spacing: 10) {
                Image(systemName: "speaker.wave.2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.bottom, 10)
                Text("Listen!")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.mainText)
                Text("Tap on the Spanish text to hear translation!")
                    .font(.headline)
                    .foregroundStyle(Color.mainText)
            }
            
        }
    }
}

#Preview {
    OnboardingSecondView()
}
