//  BccGallery.swift
//  Mandle

import SwiftUI

struct BccGalleryView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding private var path: [NavigationDestinaion]
    
    init(path: Binding<[NavigationDestinaion]>) {
        self._path = path
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                HStack(alignment: .bottom) {
                    Text("Basal Cell\nCarcinoma")
                        .font(.title2)
                    Spacer()
                    Button {
                        path.append(.atopicView)
                    } label: {
                        Text("show details")
                            .font(.body2)
                    }
                }
                
                // TODO: 조건
                Text("No Photos")
                    .font(.body1)
                    .foregroundStyle(Color.secondaryText)
                    .padding(.top, 240)
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
    BccGalleryView(path: .constant([]))
}
