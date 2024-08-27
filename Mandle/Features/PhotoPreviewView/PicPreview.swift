//  PicPreview.swift
//  Mandle

import SwiftUI

struct PicPreview: View {
    var body: some View {
        NavigationStack{
            GeometryReader{
                metrics in
                
                VStack(spacing: 18){
                        
                    Text("Camera")
                    
                    RoundedRectangle(cornerRadius: 0)
                        .frame(height: metrics.size.height * 0.79)
                    HStack{
                        Button(action: {
                        }, label: {
                            Text("Retake")
                                .foregroundStyle(.black)
                                .frame(maxWidth: 110)
                                .padding(13)
                                .background(Color.recButton)
                                .clipShape(RoundedRectangle(cornerRadius: 13))
                        })
                        Spacer()
                        Button(action: {}, label: {
                            Text("Confirm")
                                .foregroundStyle(.black)
                                .frame(maxWidth: 110)
                                .padding(13)
                                .background(Color.recButton)
                                .clipShape(RoundedRectangle(cornerRadius: 13))
                        })
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
        .padding(.top, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    PicPreview()
}
