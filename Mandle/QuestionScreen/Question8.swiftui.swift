//  Question8.swiftui.swift
//  Mandle

import SwiftUI

struct Question8: View {
    @State var quali = 0
    @Binding var move : Int
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Welcome")
                .font(.system(size: 30, weight: .bold))
            ProgressView(value: 0.8)
                .accentColor(.slider)
            Text("8. What is your skin type?")
                .padding(.top, 20)
                .font(.system(size: 17))
            
            //answer choices
            RadioButton(quali : $quali, val : 1, label : "Normal")
            RadioButton(quali : $quali, val : 2, label : "Dry")
            RadioButton(quali : $quali, val : 3, label : "Sensative")
            RadioButton(quali : $quali, val : 4, label : "Combination")
            RadioButton(quali : $quali, val : 5, label : "Oily")
            
            Spacer()
            NextBackButton(back : {move = 7}, next : {move = 9})
            
        }
        .padding(.horizontal, 50)
        .padding(.vertical, 50)
        .background(Color(hex: "C8C2B4"))
    }
}

#Preview {
    Question8(move : .constant(8))
}
