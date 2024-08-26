//  Question3.swiftui.swift
//  Mandle

import SwiftUI

struct Question3: View {
    @State var quali = 0
    @State var progress = 0.5
    @Binding var move : Int
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Welcome")
                .font(.system(size: 30, weight: .bold))
            ProgressView(value: 0.3)
                .accentColor(.slider)
            Text("3. How stressful is your living environment on a scale of 1-10")
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
            NextBackButton(back : {move = 2}, next : {move = 4})
        }
        .padding(.horizontal, 50)
        .padding(.vertical, 50)
        .background(Color(hex: "C8C2B4"))
    }
}

#Preview {
    Question3(move : .constant(3))
}
