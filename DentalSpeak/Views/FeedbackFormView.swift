//
//  FeedbackFormView.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/15/24.
//

import SwiftUI

struct FeedbackFormView: View {
    
    @State private var textInput = ""
    @FocusState private var focus: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(.lightGreen), Color(.darkGreen)],
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack {
                Text("Have a question, problem, or a feature request? Let us know!")
                    .multilineTextAlignment(.center)
                    .padding()
                
                TextField("Submit feedback", text: $textInput)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .onSubmit {
                        print(textInput)
                    }
                    .focused($focus)
                
                Button("Submit") {
                    print("Form Submitted")
                }
                .padding()
                .foregroundStyle(Color.mainText)
                .background(Color.menuSelection)
                .clipShape(Capsule())
                    
                
            }
            .onAppear {
                focus = true
            }
            
        }
    }
}

#Preview {
    FeedbackFormView()
}
