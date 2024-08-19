//  Question9.swiftui.swift
//  Mandle

import SwiftUI

struct Question9: View {
    @State var quali = 0
    @State var progress = 0.5
    @Binding var move : Int
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Welcome")
                .font(.system(size: 30, weight: .bold))
            ProgressView(value: 0.9)
                .accentColor(.slider)
            Text("9. How often do you get sun exposure on a scale of 1-10")
                .padding(.top, 20)
                .font(.system(size: 17))
                
            
            //scale answer
            HStack{
                Text("1")
                Slider(value: $progress, in: 1...10, step: 1)
                    .padding(.horizontal)
                    .tint(Color(hex: "9E645F"))
                Text("10")
            }
            
            Spacer()
            NextBackButton(back : {move = 8}, next : {move = 10})
            
        }
        .padding(.horizontal, 50)
        .padding(.vertical, 50)
        .background(Color(hex: "C8C2B4"))
    }
}

#Preview {
    Question9(move : .constant(9))
}
