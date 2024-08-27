//  QuestionView.swift
//  Mandle

import SwiftUI

struct QuestionView: View {
    @State private var viewModel = QuestionViewModel(user: .initialUser, step: 1)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Welcome")
                .font(.title2)
            
            ProgressView(value: Double(viewModel.step) / 10)
                .accentColor(.loading)
                .animation(.easeIn, value: viewModel.step)
            
            switch viewModel.step {
            case 1:
                Question1View(viewModel: $viewModel)
            case 2:
                Question2View(viewModel: $viewModel)
            case 3:
                Question3View(viewModel: $viewModel)
            case 4:
                Question4View(viewModel: $viewModel)
            case 5:
                Question5View(viewModel: $viewModel)
            case 6:
                Question6View(viewModel: $viewModel)
            case 7:
                Question7View(viewModel: $viewModel)
            case 8:
                Question8View(viewModel: $viewModel)
            case 9:
                Question9View(viewModel: $viewModel)
            case 10:
                Question10View(viewModel: $viewModel)
            default:
                fatalError("There is no screen for question")
            }
        }
        .padding(.vertical, 40)
        .padding(.horizontal, 24)
        .background(Color.background.ignoresSafeArea())
    }
}

#Preview {
    QuestionView()
}
