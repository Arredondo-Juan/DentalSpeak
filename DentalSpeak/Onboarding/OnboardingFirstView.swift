//
//  OnboardingFirstView.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/17/24.
//

import SwiftUI

struct OnboardingFirstView: View {
    var body: some View {
        ZStack {
            
            LinearGradient(colors: [Color(.lightGreen), Color(.darkGreen)],
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack (spacing: 10) {
                Image("dentalspeaklogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 125, height: 125)
                    .padding(.bottom, 10)
                Text("Welcome to DentalSpeak!")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.mainText)
                Text("An app to help Dental Professionals communicate with Spanish speakers!")
                    .font(.headline)
                    .foregroundStyle(Color.mainText)
            }
            
        }
    }
}

#Preview {
    OnboardingFirstView()
}
