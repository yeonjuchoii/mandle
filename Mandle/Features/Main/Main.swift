//  Main.swift
//  Mandle

//해상도가 다르니 간격으로 생각 (Padding : 좌우로 부터 얼마나 떨어지는지)

import SwiftUI

struct Main: View {
    @State var isCameraOn = false
    
    var body: some View {
        NavigationStack{
            GeometryReader{ 
                metrics in
                
                VStack(spacing: 20){
                    HStack{
                        Text("Home")
                        
                        Button(action: {isCameraOn = true}, label: {Image("cameraIcon")})
                    }
                    
                    HStack{
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(Color(hex: "D9D9D9"))
                        
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(Color(hex: "D9D9D9"))
                    }
                    .frame(height: metrics.size.height * 0.17)
                    
                    HStack{
                        //acne part
                        NavigationLink(destination: {AcneGallery()}){
                            RoundedRectangle(cornerRadius: 25)
                                .foregroundColor(Color(hex: "D9D9D9"))
                        }
                        //atopic part
                        NavigationLink(destination: {AtopicGallery()}){
                            RoundedRectangle(cornerRadius: 25)
                                .foregroundColor(Color(hex: "D9D9D9"))
                        }
                    }
                    .frame(width: .infinity, height: metrics.size.height * 0.41)
                    
                    //BCC part
                    NavigationLink(destination: {BccGallery()}){
                        RoundedRectangle(cornerRadius: 32)
                            .foregroundColor(Color(hex: "D9D9D9"))
                            .frame(width: .infinity, height: metrics.size.height * 0.25)
                    }
                }
                //$ : state --> binding
                .fullScreenCover(isPresented: $isCameraOn, content: {
                    Camera(isCameraOn:  $isCameraOn)
                })
            }
            .padding(.top, 20)
            .padding(.horizontal, 25)
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex : "CCC5AC"))
        }
    }
}

#Preview {
    Main()
}
