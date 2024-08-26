//  QuestionView.swift
//  Mandle

import SwiftUI

struct Question1: View {
    @State var quali = 0
    @State var age = 0
    @Binding var move : Int
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Welcome")
                .font(.system(size: 30, weight: .bold))
            
            ProgressView(value: 0.1)
                .accentColor(.slider)
            //다른 부분 다른 색으로 채우는 방법?
            
            Text("1. How old are you?")
                .padding(.top, 20)
                .font(.system(size: 17))
            
            //text box or apple age scroller
            Picker(" ", selection: $age){
                Text("Select your age")
                ForEach(1..<101){
                    Text("\($0)").tag($0)
                }
            }
            .pickerStyle(.wheel)
            
            Spacer()
            Button(action: {
                move = 2
            }, label: {
                Text("Next")
                    .foregroundStyle(.black)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .padding(13)
                    .background(Color.recButton)
                    .clipShape(RoundedRectangle(cornerRadius: 13))
            })
        }
        .padding(.horizontal, 50)
        .padding(.vertical, 50)
        .background(Color(hex: "C8C2B4"))
    }
}

#Preview {
    Question1(move : .constant(1))
}
