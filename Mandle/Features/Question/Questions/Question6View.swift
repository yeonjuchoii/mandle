//  Question6.swiftui.swift
//  Mandle

import SwiftUI

struct Question6View: View {
    @Binding private var viewModel: QuestionViewModel
    
    @State private var quali = 3
    
    private var answer: String {
        switch quali {
        case 1:
            return "Yes"
        case 2:
            return "No"
        default:
            return "Unsure"
        }
    }
    
    init(viewModel: Binding<QuestionViewModel>) {
        self._viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("6. Do you consider living near the equator?")
                .font(.body1)
            
            VStack(alignment: .leading, spacing: 16) {
                RadioButton(quali : $quali, val : 1, label : "Yes")
                RadioButton(quali : $quali, val : 2, label : "No")
                RadioButton(quali : $quali, val : 3, label : "Unsure")
            }
            .padding(.top, 24)
            
            Spacer()
            
            HStack {
                FillButton(
                    action: { viewModel.stepDown() },
                    label: "Back"
                )
                FillButton(
                    action: {
                        viewModel.stepUp()
                        viewModel.saveIsConsiderLivingEquator(answer)
                    },
                    label: "Next"
                )
            }
        }
        .padding(.top, 24)
    }
}

#Preview {
    Question6View(viewModel: .constant(QuestionViewModel(user: .initialUser, step: 6)))
}
