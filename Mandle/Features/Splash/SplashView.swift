//  SplashView.swift
//  Mandle
//  Created by 최연주 on 7/28/24.
import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack{
            Image("SplashIcon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 216, height: 230)
            Text("SkinBound")
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: "C8C2B4"))
    }
}

#Preview {
    SplashView()
}
