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
                
                OnboardingViewDetails(gradientColorOne: Color.lightBlue, gradientColorTwo: Color.mediumBlue, imageName: "tooth-sparkle", headline: "Welcome to DentalSpeak!", subheadline: "Test Subheadline", buttonColor: Color.lightBlue) {
                    withAnimation {
                        selectedViewIndex = 1
                    }
                }
                .tag(0)
                
                OnboardingViewDetails(gradientColorOne: Color.lightGreen, gradientColorTwo: Color.darkGreen, imageName: "dentist-patient", headline: "Test Headline 2", subheadline: "Test Subheadline 2", buttonColor: Color.lightBlue) {
                    withAnimation {
                        selectedViewIndex = 2
                    }
                }
                .tag(1)
                
                OnboardingViewDetails(gradientColorOne: Color.lightBlue, gradientColorTwo: Color.mediumBlue, imageName: "dentist-study", headline: "Test Headline 3", subheadline: "Test subheadline 3", buttonColor: Color.lightBlue) {
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
