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
        VStack{
            //how to fit the image to scale
            Image("LoadingIcon")
            Text("Loading...")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex : "8D807D"))
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
            
            path.append(CameraViewType(path: .resultView, image: self.image, result: ["result": 0.2]))
        }
    }
}
