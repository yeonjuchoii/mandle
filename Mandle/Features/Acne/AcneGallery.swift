//  AcneGallery.swift
//  Mandle

//scroll, no photo view, 사진 자동으로 업로드 되는 방법, roundedrectangle 겹치게 하는 방법, symptoms 입력 할수있는 grid 만들기

import SwiftUI

struct AcneGallery: View {
    var body: some View {
        NavigationStack{
            GeometryReader{
                metrics in
                ScrollView{
                    VStack{
                        HStack{
                            Button(action: {}, label: {Image("BackArrow")})
                            Text("Gallery")
                            Button(action: {}, label: {Image("ShareIcon")})
                        }
                        HStack{
                            Text("ACNE")
                                .font(.system(size: 27))
                            Spacer()
                            Button(action: {}, label: {Text("show details")})
                        }
                        
                        HStack{
                            Button(action: {}, label: {Image("RecentIcon")})
                            Text("Recents")
                            Spacer()
                            Button(action: {}, label: {Image("GridIcon")})
                        }
                        
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: metrics.size.height * 0.65)
                            .accentColor(Color(hex: "EFE9E0"))
                            .overlay{
                                RoundedRectangle(cornerRadius: 25)
                                    .background(.white)
                            }
                        
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: metrics.size.height * 0.65)
                            .accentColor(Color(hex: "EFE9E0"))
                        
                    }
                }
            }
        }
        .padding(.top, 20)
        .padding(.horizontal, 25)
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex : "CCC5AC"))
        
    }
}

#Preview {
    AcneGallery()
}
