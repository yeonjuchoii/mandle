//  QuestionView.swift
//  Mandle

import SwiftUI

struct QuestionView: View {
    @State var quali = 0
    @State var move = 1
    
    var body: some View {
        if(move == 1){
            Question1(move : $move)
        }
        else if(move == 2){
            Question2(move : $move)
        }
        else if(move == 3){
            Question3(move : $move)
        }
        else if(move == 4){
            Question4(move : $move)
        }
        else if(move == 5){
            Question5(move : $move)
        }
        else if(move == 6){
            Question6(move : $move)
        }
        else if(move == 7){
            Question7(move : $move)
        }
        else if(move == 8){
            Question8(move : $move)
        }
        else if(move == 9){
            Question9(move : $move)
        }
        else if(move == 10){
            Question10(move : $move)
        }
    }
}

#Preview {
    QuestionView()
}
