//  Question10.swiftui.swift
//  Mandle

import SwiftUI

struct Question10: View {
    @State var quali = 0
    @Binding var move : Int
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Welcome")
                .font(.system(size: 30, weight: .bold))
            ProgressView(value: 1.0)
                .accentColor(.slider)
            Text("10. How often do you regularly exercise?")
                .padding(.top, 20)
                .font(.system(size: 17))
            
            //answer choices
            RadioButton(quali : $quali, val : 1, label : "Never")
            RadioButton(quali : $quali, val : 2, label : "Not Often")
            RadioButton(quali : $quali, val : 3, label : "Sometimes")
            RadioButton(quali : $quali, val : 4, label : "Often")
            RadioButton(quali : $quali, val : 5, label : "Very Often")
            
            Spacer()
            HStack{
                Button(action: {
                    move = 9
                }, label: {
                    Text("Back")
                        .foregroundStyle(.black)
                        .frame(maxWidth: 110)
                        .padding(13)
                        .background(Color.recButton)
                        .clipShape(RoundedRectangle(cornerRadius: 13))
                })
                Spacer()
                Button(action: {
                    //다음 페이지 만들기
                }, label: {
                    Text("Finish")
                        .foregroundStyle(.black)
                        .frame(maxWidth: 110)
                        .padding(13)
                        .background(Color.recButton)
                        .clipShape(RoundedRectangle(cornerRadius: 13))
                })
            }
        }
        .padding(.horizontal, 50)
        .padding(.vertical, 50)
        .background(Color(hex: "C8C2B4"))
    }
}

#Preview {
    Question10(move : .constant(10))
}
