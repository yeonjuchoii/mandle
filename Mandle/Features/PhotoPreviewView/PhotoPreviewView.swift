//  PicPreview.swift
//  Mandle

import SwiftUI

struct PhotoPreviewView: View {
    @Environment(\.dismiss) private var dismiss
    
    @Binding private var path: [CameraViewType]
    
    private let image: UIImage
    
    init(path: Binding<[CameraViewType]>, image: UIImage) {
        self._path = path
        self.image = image
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Image(uiImage: image)
                .centerCropped()
            
            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("Retake")
                        .font(.body1)
                        .foregroundStyle(.black)
                }
                Spacer()
                Button {
                    path.append(CameraViewType(path: .loadingView, image: image, result: nil))
                } label: {
                    Text("Confirm")
                        .font(.body1)
                        .foregroundStyle(.black)
                }
            }
            .padding(.horizontal, 36)
            .frame(maxWidth: .infinity, minHeight: 160)
        }
        .background(Color.background.ignoresSafeArea())
        .navigationTitle("Preview")
        .navigationBarBackButtonHidden()
    }
}
