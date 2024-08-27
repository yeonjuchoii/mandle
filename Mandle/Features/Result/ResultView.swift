//  ResultScreen.swift
//  Mandle

import SwiftData
import SwiftUI

struct ResultView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var viewModel: ResultViewModel
    
    @Binding private var isCameraOn: Bool
    @Binding private var path: [CameraViewType]
    
    init(isCameraOn: Binding<Bool>, path: Binding<[CameraViewType]>, output: [String : Double], image: UIImage) {
        self._isCameraOn = isCameraOn
        self._path = path
        self.viewModel = ResultViewModel(output: output, image: image)
    }
    
    var body: some View {
        VStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 24) {
                Text("Result")
                    .font(.title2)
                
                VStack(spacing: 4) {
                    ForEach(viewModel.output.sorted(by: {$0.value > $1.value}).map { $0.key }, id: \.self) { key in
                        HStack {
                            Text(key)
                                .font(.body1)
                                .foregroundStyle(Color.secondaryText)
                            Spacer()
                            Text("\(viewModel.output[key] ?? 0)")
                                .font(.title4)
                        }
                    }
                }
                
                Divider()
                
                Text("Write Symptom for Record")
                    .font(.title4)
                    .foregroundStyle(Color.secondaryText)
                
                TextField("", text: $viewModel.symptom, prompt: Text("Type here...")).font(.body1)
                    .padding(12)
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.textField)
                    }
                    .tint(.slider)
            }
            .padding(24)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
            )
            
            Spacer()
            
            FillButton(
                action: {
                    switch viewModel.mainCategory {
                    case "Acne":
                        path.append(CameraViewType(path: .acneView, image: viewModel.image, result: nil))
                    case "Atopic":
                        path.append(CameraViewType(path: .atopicView, image: viewModel.image, result: nil))
                    default:
                        path.append(CameraViewType(path: .bccView, image: viewModel.image, result: nil))
                    }
                },
                label: "Summary of the Result"
            )
            FillButton(
                action: {
                    path.append(CameraViewType(path: .howToProtectView, image: viewModel.image, result: nil))
                },
                label: "How to Protect Your Skin"
            )
            FillButton(
                action: {
                    let timestamp = Date().ISO8601Format()
                    switch viewModel.mainCategory {
                    case "Acne":
                        let imageName = "Acne-\(timestamp)"
                        print(imageName)
                        ImageFileManager.shared.saveImageToDocumentDirectory(
                            imageName: imageName,
                            image: viewModel.image
                        )
                        modelContext.insert(Acne(timestamp: Date(), imageName: imageName, symptom: viewModel.symptom))
                    case "Atopic":
                        let imageName = "Atopic-\(timestamp)"
                        print(imageName)
                        ImageFileManager.shared.saveImageToDocumentDirectory(
                            imageName: imageName,
                            image: viewModel.image
                        )
                        modelContext.insert(Atopic(timestamp: Date(), imageName: imageName, symptom: viewModel.symptom))
                    default:
                        let imageName = "BCC-\(timestamp)"
                        print(imageName)
                        ImageFileManager.shared.saveImageToDocumentDirectory(
                            imageName: imageName,
                            image: viewModel.image
                        )
                        modelContext.insert(Bcc(timestamp: Date(), imageName: imageName, symptom: viewModel.symptom))
                    }
                    isCameraOn.toggle()
                },
                label: "Save"
            )
        }
        .padding(.vertical, 32)
        .padding(.horizontal, 24)
        .background(Color.background.ignoresSafeArea())
        .navigationTitle("Result")
        .navigationBarBackButtonHidden()
    }
}
