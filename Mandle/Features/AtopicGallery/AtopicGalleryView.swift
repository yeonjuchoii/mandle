//  AtopicGallery.swift
//  Mandle

import SwiftData
import SwiftUI

struct AtopicGalleryView: View {
    @Query private var atopics: [Atopic]
    
    @Environment(\.dismiss) var dismiss
    
    @Binding private var path: [NavigationDestinaion]
    
    init(path: Binding<[NavigationDestinaion]>) {
        self._path = path
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                HStack(alignment: .bottom) {
                    Text("ATOPIC\nDERMATITIS")
                        .font(.title2)
                    Spacer()
                    Button {
                        path.append(.atopicView)
                    } label: {
                        Text("show details")
                            .font(.body2)
                    }
                }
                
                if atopics.isEmpty {
                    Text("No Photos")
                        .font(.body1)
                        .foregroundStyle(Color.secondaryText)
                        .padding(.top, 240)
                } else {
                    ForEach(atopics) { atopic in
                        VStack(alignment: .leading, spacing: 0) {
                            if let uiImage = ImageFileManager.shared.loadImageFromDocumentDirectory(imageName: atopic.imageName) {
                                Image(uiImage: uiImage)
                                    .centerCropped()
                                    .frame(height: 360)
                            } else {
                                Rectangle()
                                    .fill(Color.secondaryText)
                            }
                            Text(atopic.symptom)
                                .padding(24)
                        }
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                }
            }
            .padding(.vertical, 28)
            .padding(.horizontal, 24)
        }
        .background(Color.background.ignoresSafeArea())
        .navigationTitle("Gallery")
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image("BackArrow")
                }
            }
        }
    }
}

#Preview {
    AtopicGalleryView(path: .constant([]))
}
