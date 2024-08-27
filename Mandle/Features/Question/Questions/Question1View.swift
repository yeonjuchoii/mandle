//  QuestionView.swift
//  Mandle

import SwiftUI

struct Question1View: View {
    @Binding private var viewModel: QuestionViewModel
    
    @State private var age = 15
    
    init(viewModel: Binding<QuestionViewModel>) {
        self._viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("1. How old are you?")
                .font(.body1)
            
            Picker("", selection: $age) {
                ForEach(1..<101) {
                    Text("\($0)")
                        .tag($0)
                }
            }
            .pickerStyle(.wheel)
            
            Spacer()
            
            FillButton(
                action: {
                    viewModel.saveAge(age)
                    viewModel.stepUp()
                },
                label: "Next"
            )
        }
        .padding(.top, 24)
    }
}

#Preview {
    Question1View(viewModel: .constant(QuestionViewModel(user: .initialUser, step: 1)))
}
