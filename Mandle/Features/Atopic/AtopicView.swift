//  AtopicGallery_.swift
//  Mandle

import SwiftUI

struct AtopicView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("ATOPIC\nDERMATITIS")
                    .font(.title2)
                
                Text("""
                """)
                .font(.body2)
                .lineSpacing(4)
            }
            .padding(.vertical, 28)
            .padding(.horizontal, 24)
        }
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
    AtopicView()
}
