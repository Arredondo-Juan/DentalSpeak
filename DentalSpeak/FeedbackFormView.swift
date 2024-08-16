//
//  FeedbackFormView.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/15/24.
//

import SwiftUI

struct FeedbackFormView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(.blue), Color(.white)],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            Text("Submit Feedback")
        }
    }
}

#Preview {
    FeedbackFormView()
}
