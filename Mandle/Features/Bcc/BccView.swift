//  BccGallery_.swift
//  Mandle

import SwiftUI

struct BccView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("BASAL CELL\nCARCINOMA")
                    .font(.title2)
                
                Text("""
                """)
                .font(.body2)
                .lineSpacing(4)
            }
            .padding(.vertical, 28)
            .padding(.horizontal, 24)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.secondaryBackground.ignoresSafeArea())
        .navigationTitle("")
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
    BccView()
}
