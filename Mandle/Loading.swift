//  Loading.swift
//  Mandle

import SwiftUI

struct Loading: View {
    var body: some View {
        VStack{
            //how to fit the image to scale
            Image("LoadingIcon")
            Text("Loading...")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex : "8D807D"))
    }
}

#Preview {
    Loading()
}
