//  Question6.swiftui.swift
//  Mandle

import SwiftUI

struct Question6: View {
    @State var quali = 0
    @Binding var move : Int
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Welcome")
                .font(.system(size: 30, weight: .bold))
            ProgressView(value: 0.6)
                .accentColor(.slider)
            Text("6. Do you consider living near the equator?")
                .padding(.top, 20)
                .font(.system(size: 17))
            
            //ans choices
            RadioButton(quali : $quali, val : 1, label : "Yes")
            RadioButton(quali : $quali, val : 2, label : "No")
            RadioButton(quali : $quali, val : 3, label : "Unsure")
            
            Spacer()
            NextBackButton(back : {move = 5}, next : {move = 7})
            
        }
        .padding(.horizontal, 50)
        .padding(.vertical, 50)
        .background(Color(hex: "C8C2B4"))
    }
}

#Preview {
    Question6(move : .constant(6))
}
