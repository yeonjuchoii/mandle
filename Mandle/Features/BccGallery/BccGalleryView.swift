//  BccGallery.swift
//  Mandle

import SwiftData
import SwiftUI

struct BccGalleryView: View {
    @Query private var bccs: [Bcc]
    
    @Environment(\.dismiss) var dismiss
    
    @Binding private var path: [NavigationDestinaion]
    
    init(path: Binding<[NavigationDestinaion]>) {
        self._path = path
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                HStack(alignment: .bottom) {
                    Text("BASAL CELL\nCARCINOMA")
                        .font(.title2)
                    Spacer()
                    Button {
                        path.append(.bccView)
                    } label: {
                        Text("show details")
                            .font(.body2)
                    }
                }
                
                if bccs.isEmpty {
                    Text("No Photos")
                        .font(.body1)
                        .foregroundStyle(Color.secondaryText)
                        .padding(.top, 240)
                } else {
                    ForEach(bccs) { bcc in
                        Text(bcc.symptom)
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
    BccGalleryView(path: .constant([]))
}
