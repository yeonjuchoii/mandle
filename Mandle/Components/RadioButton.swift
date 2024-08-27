//  RadioButton.swiftui.swift
//  Mandle

import SwiftUI

struct RadioButton: View {
    @Binding var quali: Int
    
    let val: Int
    let label: String
    
    var body: some View {
        Button {
            quali = val
        } label: {
            HStack(spacing: 12) {
                Circle()
                    .fill((quali == val) ? Color.buttonOn : Color.buttonOff)
                    .padding(4)
                    .overlay {
                        Circle()
                            .stroke((quali == val) ? Color.buttonOn : Color.buttonOff, lineWidth: 2)
                    }
                    .frame(width: 28, height: 28)
                Text(label)
                    .font(.body1)
                    .tint(.black)
            }
        }
    }
}

#Preview {
    RadioButton(quali : .constant(1), val : 0, label : "hello")
}
