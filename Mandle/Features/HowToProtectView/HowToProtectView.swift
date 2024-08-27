//
//  HowToProtectView.swift
//  Mandle
//
//  Created by 정지혁 on 8/28/24.
//

import SwiftUI

struct HowToProtectView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("How to protect your skin")
                    .font(.title2)
                
                Text("""
            A skin condition when hair follicles under the skin and becomes clogged. Here, sebum oil (that keeps the skin from drying out) and dead skin cells block the pores (tiny skin openings), leading to pimples or zits. In healthy acne-free skin, an organ under the skin called the sebaceous gland produces sebum oil that
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
    HowToProtectView()
}
