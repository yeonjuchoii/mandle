//  LoadingView.swift
//  Mandle

import SwiftUI

struct LoadingView: View {
    @Environment(\.dismiss) var dismiss
    
    private let image: UIImage
    
    @Binding private var path: [CameraViewType]
    
    init(path: Binding<[CameraViewType]>, image: UIImage) {
        self.image = image
        self._path = path
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Image("LoadingIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 160, height: 160)
            Text("Loading...")
                .font(.title3)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.secondaryBackground)
        .navigationBarBackButtonHidden()
        .task {
            guard let image = self.image.convertToBuffer(),
                  let model = try? SkinProblemClassifier(),
                  let result = try? model.prediction(image: image) else {
                dismiss()
                return
            }
            
            print(result.featureNames)
            print(result.targetProbability)
            
            try? await Task.sleep(for: .seconds(2))
            
            path.append(
                CameraViewType(
                    path: .resultView,
                    image: self.image,
                    result: [
                        "Acne": result.targetProbability["Acne"] ?? 0,
                        "Atopic": result.targetProbability["Atopic"] ?? 0,
                        "Basal Cell Carcinoma (BCC)": result.targetProbability["Basal Cell Carcinoma (BCC)"] ?? 0
                    ]
                )
            )
        }
    }
}
