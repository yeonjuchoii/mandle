// OnBoardingView.swift
//  Mandle
//
//  Created by 최연주 on 7/28/24.

import SwiftUI

struct OnBoardingView: View {
    @State var progress1 = 0.5
    @State var progress2 = 0.5
    var body: some View {
        ScrollView{
            VStack{
                Text("Background Information")
                    .padding(.top, 20)
                ProgressView(value: progress1)
                    .padding(.horizontal, 50)
                Slider(value: $progress1)
                    .padding(.horizontal, 50)
                Slider(value: $progress2)
                    .padding(.horizontal, 50)
                
            }
        }
    }
}

#Preview {
    OnBoardingView()
}
