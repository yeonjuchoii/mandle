//  AcneGallery_.swift
//  Mandle

import SwiftUI

struct AcneView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("ACNE")
                    .font(.title2)
                
                Text("""
                A skin condition when hair follicles under the skin and becomes clogged. Here, sebum oil (that keeps the skin from drying out) and dead skin cells block the pores (tiny skin openings), leading to pimples or zits. In healthy acne-free skin, an organ under the skin called the sebaceous gland produces sebum oil that empties through the pores to the outer skin. However, acne makes the hair, sebum oil, and keratinocytes (skin cells on the outer layer) adhere together inside the pores. The clogging also forms bacteria that cause inflammation, such as swelling, redness, and sometimes pain. When the clogged follicles break down, it spills all the bacteria, hair, and oils onto the skin, creating lesions or pimples.
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
    AcneView()
}
