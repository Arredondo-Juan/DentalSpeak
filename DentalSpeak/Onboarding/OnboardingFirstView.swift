//
//  OnboardingFirstView.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/17/24.
//

import SwiftUI

struct OnboardingFirstView: View {
    var body: some View {
        NavigationView {
            ZStack {
                
                LinearGradient(colors: [Color(.lightBlue), Color(.mediumBlue)],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
                
                VStack (spacing: 10) {
                    Image("tooth-shine")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 125, height: 125)
                        .padding(.bottom, 10)
                        .shadow(radius: 5, y:5)
                    Text("Welcome to DentalSpeak!")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(Color.mainText)
                    Text("An app to help Dental Professionals communicate with Spanish speakers!")
                        .font(.headline)
                        .foregroundStyle(Color.mainText)
                        .padding(.bottom, 25)
                    
                    NavigationLink(destination: OnboardingSecondView()) {
                        Text("Next")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                         
                    }
                    
                    
                }
            }
            
        }
    }
}

#Preview {
    OnboardingFirstView()
}
