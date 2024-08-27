//  Question7.swiftui.swift
//  Mandle

import SwiftUI

struct Question7View: View {
    @Binding private var viewModel: QuestionViewModel
    
    @State private var quali = 2
    
    private var answer: Bool {
        switch quali {
        case 1:
            return true
        default:
            return false
        }
    }
    
    init(viewModel: Binding<QuestionViewModel>) {
        self._viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("7. Did anyone in your family have prior diagnosis with skin cancer?")
                .font(.body1)
            
            VStack(alignment: .leading, spacing: 16) {
                RadioButton(quali : $quali, val : 1, label : "Yes")
                RadioButton(quali : $quali, val : 2, label : "No")
            }
            
            Spacer()
            
            HStack {
                FillButton(
                    action: { viewModel.stepDown() },
                    label: "Back"
                )
                FillButton(
                    action: {
                        viewModel.stepUp()
                        viewModel.saveHasFamilyHaveSkinCancer(answer)
                    },
                    label: "Next"
                )
            }
        }
        .padding(.top, 24)
    }
}

#Preview {
    Question7View(viewModel: .constant(QuestionViewModel(user: .initialUser, step: 7)))
}
