//  NextBackButton.swift
//  Mandle

import SwiftUI

struct NextBackButton: View {
    //let name : (parameters) -> return type
    let back : () -> Void
    let next : () -> Void
    
    var body: some View {
        HStack{
            Button(action: {
                //함수 call
                back()
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
                next()
            }, label: {
                Text("Next")
                    .foregroundStyle(.black)
                    .frame(maxWidth: 110)
                    .padding(13)
                    .background(Color.recButton)
                    .clipShape(RoundedRectangle(cornerRadius: 13))
            })
        }
    }
}

#Preview {
    //함수 선언 하기
    NextBackButton(back : {}, next : {})
}
