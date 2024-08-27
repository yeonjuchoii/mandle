//  Question10.swiftui.swift
//  Mandle

import SwiftData
import SwiftUI

enum Frequency: Int, CaseIterable {
    case never = 1
    case notOften
    case sometimes
    case often
    case veryOften
    
    var label: String {
        switch self {
        case .never:
            return "Never"
        case .notOften:
            return "Not Often"
        case .sometimes:
            return "Sometimes"
        case .often:
            return "Often"
        case .veryOften:
            return "Very Often"
        }
    }
}

struct Question10View: View {
    @Environment(\.modelContext) var modelContext
    
    @Binding private var viewModel: QuestionViewModel
    
    @State private var quali = Frequency.never.rawValue
    
    private let frequencies = Frequency.allCases
    
    init(viewModel: Binding<QuestionViewModel>) {
        self._viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("10. How often do you regularly exercise?")
                .font(.body1)
            
            VStack(alignment: .leading, spacing: 16) {
                ForEach(frequencies, id: \.self) { frequency in
                    RadioButton(quali: $quali, val: frequency.rawValue, label: frequency.label)
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
                        viewModel.saveExercise(frequencies[quali - 1])
                        modelContext.insert(viewModel.user)
                    },
                    label: "Finish"
                )
            }
        }
        .padding(.top, 24)
    }
}

#Preview {
    Question10View(viewModel: .constant(QuestionViewModel(user: .initialUser, step: 10)))
}
