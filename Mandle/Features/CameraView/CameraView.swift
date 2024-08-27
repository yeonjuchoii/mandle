//  Camera.swift
//  Mandle

//space 뛰우는 방법, 사진 찍는 버튼, flash 버튼, flip camera button, 사진 선명도 띄우는 방법

import SwiftUI

struct CameraView: View {
    @Binding private var isCameraOn : Bool
    
    
    
    init(isCameraOn: Binding<Bool>) {
        self._isCameraOn = isCameraOn
    }
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 18) {
                
                HStack {
                    Button {
                        
                    } label: {
                        Circle()
                            .fill(Color.takeButton)
                            .frame(width: 64, height: 64)
                            .padding(4)
                            .overlay {
                                Circle()
                                    .stroke(Color.takeButton, lineWidth: 2)
                            }
                    }
                }
                .frame(maxWidth: .infinity, minHeight: 160)
                .overlay(alignment: .trailing) {
                    Button {
                        
                    } label: {
                        Image("FlipCamera")
                            .padding(8)
                            .background {
                                Circle()
                                    .fill(Color.takeButton.opacity(0.2))
                            }
                    }
                    .padding(.horizontal, 24)
                }
            }
            .background(Color.background.ignoresSafeArea())
            .navigationTitle("Camera")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isCameraOn.toggle()
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .foregroundStyle(Color.black)
                            .frame(width: 16, height: 16)
                    }
                }
            }
        }
    }
}

#Preview {
    // binding doesnt have a dedicated value so we need to assign one, state already has a value
    CameraView(isCameraOn: .constant(true))
}
