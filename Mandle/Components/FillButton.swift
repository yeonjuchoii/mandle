//
//  FillButton.swift
//  Mandle
//
//  Created by 정지혁 on 8/27/24.
//

import SwiftUI

struct FillButton: View {
    let action: () -> Void
    let label: String
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(label)
                .font(.title4)
                .foregroundStyle(.black)
                .padding(12)
                .frame(maxWidth: .infinity)
                .background(Color.recButton)
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
        }
    }
}

#Preview {
    FillButton(action: {}, label: "Next")
}
