//  QuestionView.swift
//  Mandle
import SwiftUI

struct Question2: View {
    @State var quali = 0
    @Binding var move : Int
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Welcome")
                .font(.system(size: 30, weight: .bold))
            ProgressView(value: 0.2)
                .accentColor(.slider)
            Text("2. What is your gender?")
                .padding(.top, 20)
                .font(.system(size: 17))
            
            RadioButton(quali : $quali, val : 1, label : "Female")
            RadioButton(quali : $quali, val : 2, label : "Male")
            RadioButton(quali : $quali, val : 3, label : "Other")
        
            Spacer()
            
            NextBackButton(back : {move = 1}, next : {move = 3})
            
            
        }
        .padding(.horizontal, 50)
        .padding(.vertical, 50)
        .background(Color(hex: "C8C2B4"))
    }
}

#Preview {
    Question2(move : .constant(2))
}
