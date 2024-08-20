//
//  OnboardingSecondView.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/17/24.
//

import SwiftUI

struct OnboardingSecondView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                
                LinearGradient(colors: [Color(.lightGreen), Color(.darkGreen)],
                               startPoint: .top,
                               endPoint: .bottom)
                .ignoresSafeArea()
                
                VStack (spacing: 10) {
                    Image("dentist-patient")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .padding(.bottom, 10)
                        .shadow(radius: 5, y:5)
                    Text("Listen!")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(Color.mainText)
                    Text("Tap on the Spanish text to hear translation!")
                        .font(.headline)
                        .foregroundStyle(Color.mainText)
                        .padding(.bottom, 25)
                    
                    NavigationLink(destination: OnboardingThirdView()) {
                        Text("Next")
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
}

#Preview {
    OnboardingSecondView()
}
