//  Question5.swiftui.swift
//  Mandle

import SwiftUI

struct Question5: View {
    @State var quali = 0
    @State var allergies = ""
    @Binding var move : Int
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Welcome")
                .font(.system(size: 30, weight: .bold))
            ProgressView(value: 0.5)
                .accentColor(.slider)
            Text("5. Do you have any allergies? (egg, dust mites, food, animal dander, fur, sun, etc)")
                .padding(.top, 20)
                .font(.system(size: 17))
            
            //need to have text boxes
            TextField("  ", text: $allergies, prompt: Text("Type here"))
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 5).fill(Color(hex : "DBD7D2")))
                .tint(.slider)

                
            
            Spacer()
            NextBackButton(back : {move = 4}, next : {move = 6})
            
        }
        .padding(.horizontal, 50)
        .padding(.vertical, 50)
        .background(Color(hex: "C8C2B4"))
    }
}

#Preview {
    Question5(move : .constant(5))
}
