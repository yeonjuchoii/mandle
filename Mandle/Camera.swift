//  Camera.swift
//  Mandle

//space 뛰우는 방법, 사진 찍는 버튼, flash 버튼, flip camera button, 사진 선명도 띄우는 방법

import SwiftUI

struct Camera: View {
    @Binding var isCameraOn : Bool
    
    var body: some View {
        NavigationStack{
            GeometryReader{
                metrics in
                
                VStack(spacing: 18){
                    HStack{
                        Button(action: {isCameraOn = false}, label: {Image("BackArrow")})
                        Text("Camera")
                        
                        //flashlight
                        Button(action: {}, label: {Image("FlashLight")})
                    }
                    
                    RoundedRectangle(cornerRadius: 0)
                        .frame(height: metrics.size.height * 0.77)
                    HStack{
                        //camera shutter
                        //how to make outter stroke
                        Button(action: {isCameraOn = false}, label: {
                            RoundedRectangle(cornerRadius: 50)
                                .frame(width: metrics.size.width * 0.18, height: metrics.size.height * 0.1)
                                .accentColor(Color(hex: "616754"))})
                        Button(action: {}, label: {Image("FlipCamera")})
                        
                    }
                }
            }
        }
        .padding(.top, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    //binding doesnt have a dedicated value so we need to assign one, state already has a value
    Camera(isCameraOn: .constant(true))
}
