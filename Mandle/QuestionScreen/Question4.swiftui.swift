//  Question4.swiftui.swift
//  Mandle

import SwiftUI

struct Question4: View {
    @State var quali = 0
    @State var progress = 0.5
    @Binding var move : Int
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Welcome")
                .font(.system(size: 30, weight: .bold))
            ProgressView(value: 0.4)
                .accentColor(.slider)
            Text("4. How stressful is your school/working environment on a scale of 1-10")
                .padding(.top, 20)
                .font(.system(size: 17))
            
            HStack{
                Text("1")
                Slider(value: $progress, in: 1...10, step: 1)
                    .padding(.horizontal)
                    .tint(Color(hex: "9E645F"))
                
                Text("10")
            }
            
            Spacer()
            
            NextBackButton(back : {move = 3}, next : {move = 5})
            
        }
        .padding(.horizontal, 50)
        .padding(.vertical, 50)
        .background(Color(hex: "C8C2B4"))
    }
}

#Preview {
    Question4(move : .constant(4))
}
