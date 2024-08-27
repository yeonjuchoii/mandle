//  ResultScreen.swift
//  Mandle

import SwiftUI

struct ResultScreen: View {
    //type 지정할때는 :
    let output : [String: Double]
    var body: some View {
        VStack{
            Button(action: {
                let model = try? SkinProblemClassifier()
                //let result = try? model?.prediction(image: <#T##CVPixelBuffer#>)
            }, label: {
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 400)
                .padding()})
            HStack{
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 60)
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 60)
            }
        }
        .padding(.top, 20)
        .padding(.horizontal, 40)
    }
}

//#Preview {
  //  ResultScreen(output: "")
//}
