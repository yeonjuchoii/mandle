//  Question7.swiftui.swift
//  Mandle

import SwiftUI

struct Question7: View {
    @State var quali = 0
    @Binding var move : Int
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Welcome")
                .font(.system(size: 30, weight: .bold))
            ProgressView(value: 0.7)
                .accentColor(.slider)
            Text("7. Did anyone in your family have prior diagnosis with skin cancer?")
                .padding(.top, 20)
                .font(.system(size: 17))
            
            //answer choices
            RadioButton(quali : $quali, val : 1, label : "Yes")
            RadioButton(quali : $quali, val : 2, label : "No")
            
            Spacer()
            NextBackButton(back : {move = 6}, next : {move = 8})
            
        }
        .padding(.horizontal, 50)
        .padding(.vertical, 50)
        .background(Color(hex: "C8C2B4"))
    }
}

#Preview {
    Question7(move : .constant(7))
}
