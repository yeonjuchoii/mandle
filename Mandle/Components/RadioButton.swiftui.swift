//  RadioButton.swiftui.swift
//  Mandle

import SwiftUI

struct RadioButton: View {
    @Binding var quali : Int
    let val : Int
    let label : String
    
    var body: some View {
        Button(action:{quali = val}){
            Text("   ")
                .frame(width: 20, height:20)
            //조건 ? 참 : 거짓 (연산자)
                .background((quali == val) ? Color.buttonOn : Color.buttonOff)
                .cornerRadius(100)
                .foregroundColor(Color.buttonOn)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 100)
                    .stroke((quali == val) ? Color.buttonOn : Color.buttonOff, lineWidth: 3)
                    .scaleEffect(0.5))
            Text(label)
                .tint(.black)
        }
    }
}

#Preview {
    RadioButton(quali : .constant(1), val : 0, label : "hello")
}
