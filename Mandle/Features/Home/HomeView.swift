//  HomeView.swift
//  Mandle

//해상도가 다르니 간격으로 생각 (Padding : 좌우로 부터 얼마나 떨어지는지)

import SwiftData
import SwiftUI

enum NavigationDestinaion {
    case acneGalleryView
    case acneView
    case atopicGalleryView
    case atopicView
    case bccGalleryView
    case bccView
}

struct HomeView: View {
    @Query private var acnes: [Acne]
    @Query private var atopics: [Atopic]
    @Query private var bccs: [Bcc]
    
    @State private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            VStack(spacing: 16) {
                HStack(spacing: 16) {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("UV Index")
                            .font(.body2)
                            .foregroundStyle(Color.secondaryText)
                        Text("3")
                            .font(.title2)
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white)
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Humidty")
                            .font(.body2)
                            .foregroundStyle(Color.secondaryText)
                        Text("58%")
                            .font(.title2)
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white)
                    }
                }
                .frame(height: 80)
                HStack(spacing: 16) {
                    Button {
                        viewModel.navigate(destination: .acneGalleryView)
                    } label: {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("ACNE")
                                .font(.body2)
                                .foregroundStyle(Color.secondaryText)
                            Spacer()
                            Text("\(acnes.count) pics")
                                .font(.title2)
                                .foregroundStyle(Color.black)
                        }
                        .padding(16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white)
                        }
                    }
                    Button {
                        viewModel.navigate(destination: .atopicGalleryView)
                    } label: {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("ATOPIC")
                                .font(.body2)
                                .foregroundStyle(Color.secondaryText)
                            Spacer()
                            Text("\(atopics.count) pics")
                                .font(.title2)
                                .foregroundStyle(Color.black)
                        }
                        .padding(16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white)
                        }
                    }
                }
                Button {
                    viewModel.navigate(destination: .bccGalleryView)
                } label: {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("BCC")
                            .font(.body2)
                            .foregroundStyle(Color.secondaryText)
                        Spacer()
                        Text("\(bccs.count) pics")
                            .font(.title2)
                            .foregroundStyle(Color.black)
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white)
                    }
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
                    AcneView()
                case .atopicGalleryView:
                    AtopicGalleryView(path: $viewModel.path)
                case .atopicView:
                    AtopicView()
                case .bccGalleryView:
                    BccGalleryView(path: $viewModel.path)
                case .bccView:
                    BccView()
                }
            }
            .fullScreenCover(isPresented: $viewModel.isCameraOn) {
                Camera(isCameraOn: $viewModel.isCameraOn)
            }
        }
    }
}

#Preview {
    HomeView()
}
