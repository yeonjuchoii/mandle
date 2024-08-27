//  Question5.swiftui.swift
//  Mandle

import SwiftUI

struct Question5View: View {
    @Binding private var viewModel: QuestionViewModel
    
    @State private var allergies = ""
    
    init(viewModel: Binding<QuestionViewModel>) {
        self._viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("5. Do you have any allergies? (egg, dust mites, food, animal dander, fur, sun, etc)")
                .font(.body1)
            
            TextField("", text: $allergies, prompt: Text("Type here"))
                .font(.body1)
                .padding(12)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.textField)
                }
                .tint(.slider)
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
                        viewModel.saveAllergies(allergies)
                    },
                    label: "Next"
                )
            }
        }
        .padding(.top, 24)
    }
}

#Preview {
    Question5View(viewModel: .constant(QuestionViewModel(user: .initialUser, step: 5)))
}
