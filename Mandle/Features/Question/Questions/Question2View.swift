//  QuestionView.swift
//  Mandle
import SwiftUI

enum Gender: Int, CaseIterable {
    case female = 1
    case male = 2
    case other = 3
    
    var label: String {
        switch self {
        case .female:
            return "Female"
        case .male:
            return "Male"
        case .other:
            return "Other"
        }
    }
}

struct Question2View: View {
    @Binding private var viewModel: QuestionViewModel
    
    @State private var quali = Gender.other.rawValue
    
    private let genders = Gender.allCases
    
    init(viewModel: Binding<QuestionViewModel>) {
        self._viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("2. What is your gender?")
                .font(.body1)
            
            VStack(alignment: .leading, spacing: 16) {
                ForEach(genders, id: \.self) { gender in
                    RadioButton(quali: $quali, val: gender.rawValue, label: gender.label)
                }
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
                        viewModel.saveGender(genders[quali - 1])
                    },
                    label: "Next"
                )
            }
        }
        .padding(.top, 24)
    }
}

#Preview {
    Question2View(viewModel: .constant(QuestionViewModel(user: .initialUser, step: 2)))
}
