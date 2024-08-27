//  Main.swift
//  Mandle

//해상도가 다르니 간격으로 생각 (Padding : 좌우로 부터 얼마나 떨어지는지)

import SwiftUI

enum NavigationDestinaion {
    case acneGalleryView
    case acneView
    case atopicGalleryView
    case atopicView
    case bccGalleryView
    case bccView
}

struct MainView: View {
    @State private var viewModel = MainViewModel()
    
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            VStack {
                HStack {
                    Rectangle()
                    Rectangle()
                }
                .frame(height: 80)
                HStack {
                    Button {
                        viewModel.navigate(destination: .acneGalleryView)
                    } label: {
                        Rectangle()
                    }
                    Button {
                        viewModel.navigate(destination: .atopicGalleryView)
                    } label: {
                        Rectangle()
                    }
                }
                Button {
                    viewModel.navigate(destination: .bccGalleryView)
                } label: {
                    Rectangle()
                }
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 24)
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.isCameraOn.toggle()
                    } label: {
                        Image("cameraIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                }
            }
            .background(Color.background.ignoresSafeArea())
            .navigationDestination(for: NavigationDestinaion.self) { destination in
                switch destination {
                case .acneGalleryView:
                    AcneGalleryView(path: $viewModel.path)
                case .acneView:
                    Text("Acne")
                case .atopicGalleryView:
                    AtopicGalleryView(path: $viewModel.path)
                case .atopicView:
                    Text("Atopic")
                case .bccGalleryView:
                    BccGalleryView(path: $viewModel.path)
                case .bccView:
                    Text("Bcc")
                }
            }
            .fullScreenCover(isPresented: $viewModel.isCameraOn) {
                Camera(isCameraOn: $viewModel.isCameraOn)
            }
        }
    }
}

#Preview {
    MainView()
}
