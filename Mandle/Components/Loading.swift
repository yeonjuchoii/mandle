//  Loading.swift
//  Mandle

import SwiftUI

struct Loading: View {
    @State var isMLon = false
    let input : SkinProblemClassifierInput
    
    var body: some View {
        NavigationStack{
            VStack{
                //how to fit the image to scale
                Image("LoadingIcon")
                Text("Loading...")
                    .onAppear(let model = try? SkinProblemClassifier())
                    .onDisappear(NavigationLink(destination: {ResultScreen()}))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex : "8D807D"))
            
            //onappear: 화면이 보였을떄 실행 --> parameter image with let, model creation
            //navigationstack 화면 넘기기 to result screen ??
        }
    }
}

/*
#Preview {
    Loading()
} */
