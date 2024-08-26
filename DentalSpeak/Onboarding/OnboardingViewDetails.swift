//
//  OnboardingViewDetails.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/19/24.
//

import SwiftUI

struct OnboardingViewDetails: View {
    
    var gradientColorOne: Color
    var gradientColorTwo: Color
    var imageName: String
    var headline: String
    var subheadline: String
    var buttonColor: Color
    var buttonAction: () -> Void
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [gradientColorOne, gradientColorTwo],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                Spacer()
                
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .padding(.bottom, 10)
                    .shadow(radius: 5, y:5)
                
                Text(headline)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.mainText)
                    .padding(.horizontal)
                
                Text(subheadline)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.mainText)
                    .padding(.horizontal)
                    .padding(.top, 4)
                
                Spacer()
                
                Button {
                    buttonAction()
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .foregroundColor(buttonColor)
                            .frame(height: 50)
                        Text("Continue")
                            .bold()
                            .foregroundStyle(.black)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 115)
            }
        }
    }
}

#Preview {
    OnboardingViewDetails(gradientColorOne: Color.lightBlue, gradientColorTwo: Color.mediumBlue, imageName: "tooth-shine", headline: "Test Headline", subheadline: "Test Subheadline", buttonColor: Color.lightBlue) {
    }
}
