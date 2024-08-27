//  Question8.swiftui.swift
//  Mandle

import SwiftUI

enum SkinType: Int, CaseIterable {
    case normal = 1
    case dry
    case sensative
    case combination
    case oily
    
    var label: String {
        switch self {
        case .normal:
            return "Normal"
        case .dry:
            return "Dry"
        case .sensative:
            return "Sensative"
        case .combination:
            return "Combination"
        case .oily:
            return "Oily"
        }
    }
}

struct Question8View: View {
    @Binding private var viewModel: QuestionViewModel
    
    @State private var quali = SkinType.normal.rawValue
    
    private let skinTypes = SkinType.allCases
    
    init(viewModel: Binding<QuestionViewModel>) {
        self._viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("8. What is your skin type?")
                .font(.body1)
            
            VStack(alignment: .leading, spacing: 16) {
                ForEach(skinTypes, id: \.self) { type in
                    RadioButton(quali: $quali, val: type.rawValue, label: type.label)
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
                        viewModel.saveSkinType(skinTypes[quali - 1])
                    },
                    label: "Next"
                )
            }
        }
        .padding(.top, 24)
    }
}

#Preview {
    Question8View(viewModel: .constant(QuestionViewModel(user: .initialUser, step: 8)))
}
