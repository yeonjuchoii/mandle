//  Question3.swiftui.swift
//  Mandle

import SwiftUI

struct Question3View: View {
    @Binding private var viewModel: QuestionViewModel
    
    @State private var score = 5.0
    
    init(viewModel: Binding<QuestionViewModel>) {
        self._viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("3. How stressful is your living environment on a scale of 1-10")
                .font(.body1)
            
            HStack {
                Text("1")
                Slider(value: $score, in: 1...10, step: 1)
                    .padding(.horizontal)
                    .accentColor(.slider)
                Text("10")
            }
            .padding(.top, 20)
            
            Spacer()
            
            HStack {
                FillButton(
                    action: { viewModel.stepDown() },
                    label: "Back"
                )
                FillButton(
                    action: {
                        viewModel.stepUp()
                        viewModel.saveLivingStressLevel(Int(score))
                    },
                    label: "Next"
                )
            }
        }
        .padding(.top, 24)
    }
}

#Preview {
    Question3View(viewModel: .constant(QuestionViewModel(user: .initialUser, step: 3)))
}
