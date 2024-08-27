//
//  MainViewModel.swift
//  Mandle
//
//  Created by 정지혁 on 8/27/24.
//

import Foundation

@Observable
class MainViewModel {
    var isCameraOn = false
    var path: [NavigationDestinaion] = []
    
    func navigate(destination: NavigationDestinaion) {
        path.append(destination)
    }
}
