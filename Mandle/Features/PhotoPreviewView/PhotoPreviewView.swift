//  PicPreview.swift
//  Mandle

import SwiftUI

struct PhotoPreviewView: View {
    let image: UIImage
    
    var body: some View {
        VStack(spacing: 0) {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
            
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
            .frame(maxWidth: .infinity, minHeight: 160)
        }
        .background(Color.background.ignoresSafeArea())
        .navigationTitle("Preview")
        .navigationBarBackButtonHidden()
    }
}
