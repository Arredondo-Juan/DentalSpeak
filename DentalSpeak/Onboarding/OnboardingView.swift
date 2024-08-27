//
//  OnboardingView.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/19/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var selectedViewIndex = 0
    @AppStorage("onboarding") var needsOnboarding = true
    
    var body: some View {
        
        ZStack {
            
            TabView (selection: $selectedViewIndex) {
                
                OnboardingViewDetails(gradientColorOne: Color.lightBlue, gradientColorTwo: Color.mediumBlue, imageName: "tooth-sparkle", headline: "Welcome to DentalSpeak!", subheadline: "Look up and learn key dental terms and phrases in Spanish with ease", buttonColor: Color.lightBlue) {
                    withAnimation {
                        selectedViewIndex = 1
                    }
                }
                .tag(0)
                
                OnboardingViewDetails(gradientColorOne: Color.lightGreen, gradientColorTwo: Color.darkGreen, imageName: "dentist-patient", headline: "Tap to Hear the Translation", subheadline: "Simply tap on any Spanish term or phrase to hear its correct pronunciation", buttonColor: Color.lightBlue) {
                    withAnimation {
                        selectedViewIndex = 2
                    }
                }
                .tag(1)
                
                OnboardingViewDetails(gradientColorOne: Color.lightBlue, gradientColorTwo: Color.mediumBlue, imageName: "dentist-study", headline: "Save and Study", subheadline: "Add terms and phrases to your Favorites tab and add flashcards to your custom Saved Deck to review later", buttonColor: Color.lightBlue) {
                    withAnimation {
                        dismiss()
                        needsOnboarding = false
                    }
                }
                .tag(2)
                
            }
            .ignoresSafeArea()
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            VStack {
                Spacer()
                HStack (spacing: 16) {
                    Spacer()
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 0 ? .white : .gray)
                    
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 1 ? .white: .gray)
                    
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 2 ? .white: .gray)
                    Spacer()
                }
                .padding(.bottom, 220)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingView(selectedViewIndex: 0)
}
