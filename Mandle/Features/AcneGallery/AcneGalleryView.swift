//  AcneGallery.swift
//  Mandle

//scroll, no photo view, 사진 자동으로 업로드 되는 방법, roundedrectangle 겹치게 하는 방법, symptoms 입력 할수있는 grid 만들기

import SwiftUI

struct AcneGalleryView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding private var path: [NavigationDestinaion]
    
    init(path: Binding<[NavigationDestinaion]>) {
        self._path = path
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                HStack(alignment: .bottom) {
                    Text("ACNE")
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
    AcneGalleryView(path: .constant([]))
}
